import OpenAPIRuntime
import Foundation
import OpenAPIURLSession

/// A protocol defining the contract for searching the iTunes App Store.
public protocol ITunesSearchClientProtocol {
    /// Fetches information about an app based on its bundle ID and optional country code.
    ///
    /// - Parameters:
    ///   - bundleId: The unique identifier of the app in the App Store.
    ///   - countryCode: The two-letter code representing the country to search in (optional). Defaults to nil.
    /// - Throws:
    ///   - ITunesSearchClientError: An error that may occur during the search process.
    /// - Returns: An `AppInfo` object containing details about the retrieved app.
    func fetchAppInfo(by bundleId: String, _ countryCode: String?) async throws -> AppInfo
}

/// A concrete implementation of `ITunesSearchClientProtocol` for interacting with the iTunes Search API.
public struct ITunesSearchClient: ITunesSearchClientProtocol {
    private let client: any APIProtocol
    
    /// Initializes a new `ITunesSearchClient` instance with a provided API client.
    ///
    /// - Parameter client: An OpenAPI client configured to interact with the iTunes Search API.
    init(client: any APIProtocol) {
        self.client = client
    }
    
    /// Initializes a new `ITunesSearchClient` instance, creating a default API client automatically.
    public init() throws {
        self.client = try Client(
            serverURL: Servers.server1(),
            transport: URLSessionTransport()
        )
    }
    
    /// Fetches information about an app based on its bundle ID and optional country code.
    ///
    /// - Parameters:
    ///   - bundleId: The unique identifier of the app in the App Store.
    ///   - countryCode: The two-letter code representing the country to search in (optional). Defaults to nil.
    /// - Throws:
    ///   - ITunesSearchClientError: An error that may occur during the search process.
    /// - Returns: An `AppInfo` object containing details about the retrieved app.
    public func fetchAppInfo(by bundleId: String, _ countryCode: String? = nil) async throws -> AppInfo {
        let query = Operations.getByBundleId.Input.Query(bundleId: bundleId, country: countryCode)
        let result = try await client.getByBundleId(query: query)
        switch result {
        case .ok(let response):
            switch response.body {
            case .json(let json):
                guard json.results?.count == 1,
                      let result = json.results?.first(where: {$0.bundleId == bundleId}) else {
                    throw ITunesSearchClientError.notFound
                }
                return AppInfo(result)
            case .text_javascript(let body):
                let bytes = 12000 // Maximum bytes to attempt parsing
                let jsonText = try await String(collecting: body, upTo: bytes)
                let jsonData = Data(jsonText.utf8)
                let appResponse = try JSONDecoder().decode(Components.Schemas.AppResponse.self, from: jsonData)
                guard appResponse.results?.count == 1,
                      let result = appResponse.results?.first(where: {$0.bundleId == bundleId}) else {
                    throw ITunesSearchClientError.notFound
                }
                return AppInfo(result)
            }
        case .default(let statusCode, _):
            throw ITunesSearchClientError.serverError(errorCode: statusCode)
        }
    }
}

/// An enumeration of errors that may occur during interactions with the iTunes Search API.
public enum ITunesSearchClientError: Error {
    /// A server-side error occurred, indicated by the provided status code.
    case serverError(errorCode: Int)
    /// No results were found for the specified bundle ID and country code.
    case notFound
}

/// A model representing information about an app retrieved from the iTunes App Store.
public struct AppInfo {
    /// The version of the app.
    public let version: String?
    /// The bundle ID of the app.
    public let bundleId: String?
    /// The date the current version of the app was released.
    public let currentVersionReleaseDate: String?
    
    /// Initializes a new `AppInfo` instance from a `Components.Schemas.Result` object.
    ///
    /// - Parameter result: The `Components.Schemas.Result` object containing the app information.
    init(_ result: Components.Schemas.Result) {
        self.version = result.version
        self.bundleId = result.bundleId
        self.currentVersionReleaseDate = result.currentVersionReleaseDate
    }
}
