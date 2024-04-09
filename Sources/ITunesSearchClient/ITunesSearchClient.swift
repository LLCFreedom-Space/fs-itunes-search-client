import OpenAPIRuntime
import Foundation
import OpenAPIURLSession

public protocol ITunesSearchClientProtocol {
    func fetchBundleIdentifiers(by bundleId: String) async throws -> [String]
    func get(by bundleId: String, _ countryCode: String?) async throws -> AppInfo
}

public struct ITunesSearchClient: ITunesSearchClientProtocol {
    private let client: any APIProtocol
    
    init(client: any APIProtocol) {
        self.client = client
    }
    
    public init() throws {
        do {
            self.client = try Client(
                serverURL: Servers.server1(),
                transport: URLSessionTransport()
            )
        } catch {
            throw ITunesSearchClientError.failedConfigClient
        }
    }
    
    public func get(by bundleId: String, _ countryCode: String? = nil) async throws -> AppInfo {
        let query = Operations.getByBundleId.Input.Query(bundleId: bundleId, country: countryCode)
        let result = try await client.getByBundleId(query: query)
        switch result {
        case .ok(let response):
            switch response.body {
            case .json(let json):
                guard json.results?.count == 1,
                      let result = json.results?.first(where: {$0.bundleId == bundleId}) else {
                    throw ITunesSearchClientError.invalidResponse
                }
                return AppInfo(result)
            case .text_javascript(let body):
                let bytes = 12000
                guard let jsonData = try await String(collecting: body, upTo: bytes).data(using: .utf8) else {
                    throw ITunesSearchClientError.failedToGetResponseData
                }
                do {
                    let appResponse = try JSONDecoder().decode(Components.Schemas.AppResponse.self, from: jsonData)
                    guard appResponse.results?.count == 1,
                          let result = appResponse.results?.first(where: {$0.bundleId == bundleId}) else {
                        throw ITunesSearchClientError.invalidResponse
                    }
                    return AppInfo(result)
                } catch {
                    throw ITunesSearchClientError.failedToDecode
                }
            }
        case .default(let statusCode, _):
            throw ITunesSearchClientError.serverError(errorCode: statusCode)
        }
    }
    
    public func fetchBundleIdentifiers(by bundleId: String) async throws -> [String] {
        let query = Operations.getByBundleId.Input.Query(bundleId: bundleId)
        let result = try await client.getByBundleId(query: query)
        switch result {
        case .ok(let response):
            switch response.body {
            case .json(let json):
                guard let result = json.results?.compactMap({ $0.bundleId }) else {
                    throw ITunesSearchClientError.emptyResult
                }
                return result
            case .text_javascript(let body):
                let bytes = 12000
                guard let jsonData = try await String(collecting: body, upTo: bytes).data(using: .utf8) else {
                    throw ITunesSearchClientError.failedToGetResponseData
                }
                do {
                    let res = try JSONDecoder().decode(Components.Schemas.AppResponse.self, from: jsonData)
                    guard let result = res.results?.compactMap({ $0.bundleId }) else {
                        throw ITunesSearchClientError.emptyResult
                    }
                    return result
                } catch {
                    throw ITunesSearchClientError.failedToDecode
                }
            }
        case .default(let statusCode, _):
            throw ITunesSearchClientError.serverError(errorCode: statusCode)
        }
    }
}

public enum ITunesSearchClientError: Error {
    case serverError(errorCode: Int)
    case failedToDecode
    case emptyResult
    case failedToGetResponseData
    case invalidResponse
    case failedConfigClient
}

public struct AppInfo {
    public let version: String?
    public let bundleId: String?
    public let currentVersionReleaseDate: String?
    
    init(_ result: Components.Schemas.Result) {
        self.version = result.version
        self.bundleId = result.bundleId
        self.currentVersionReleaseDate = result.currentVersionReleaseDate
    }
}


