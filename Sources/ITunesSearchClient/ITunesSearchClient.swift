import OpenAPIRuntime
import Foundation
import OpenAPIURLSession

public protocol ITunesSearchClientProtocol {
    func fetchBundleIdentifiers(bundleId: String) async throws -> [String]
}

public struct ITunesSearchClient: ITunesSearchClientProtocol {
    private let client: Client
    
    public init() throws {
        do {
            self.client = try Client(
                serverURL: Servers.server1(),
                transport: URLSessionTransport()
            )
        } catch {
            throw ITunesSearchClientError.failedToDecode
        }
    }
    
    public func fetchBundleIdentifiers(bundleId: String) async throws -> [String] {
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
                guard let jsonData = try await String(collecting: body, upTo: 12000).data(using: .utf8) else {
                    throw ITunesSearchClientError.failedToDecode
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
}
