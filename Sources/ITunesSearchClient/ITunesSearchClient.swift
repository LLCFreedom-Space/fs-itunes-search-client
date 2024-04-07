import OpenAPIRuntime
import Foundation
import OpenAPIURLSession

public struct ITunesSearchClient {
    private let client: Client
    
    public init() {
        self.client = try! Client(
            serverURL: Servers.server1(),
            transport: URLSessionTransport()
        )
    }
    
    public func fetchBundleIdentifiers(bundleId: String) async throws -> [String] {
        let query = Operations.getByBundleId.Input.Query(bundleId: bundleId)
        let result = try await client.getByBundleId(query: query)
        switch result {
        case .ok(let response):
            switch response.body {
            case .json(let json):
                return json.results?.compactMap({ $0.bundleId }) ?? []
            
            case .text_javascript(let body):
                print(body)
                let jsonData = try await String(collecting: body, upTo: 12000).data(using: .utf8) ?? Data()
                let res = try! JSONDecoder().decode(Components.Schemas.AppResponse.self, from: jsonData)
                return res.results?.compactMap({ $0.bundleId }) ?? []
            }
        default:
            break
        }
        return []
    }
}
