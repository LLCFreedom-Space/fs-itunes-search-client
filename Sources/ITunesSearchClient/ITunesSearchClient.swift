import OpenAPIRuntime
import Foundation
import OpenAPIURLSession

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

