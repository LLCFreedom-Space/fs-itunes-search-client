//
//  MockClient.swift
//  
//
//  Created by Mykhailo Bondarenko on 12.04.2024.
//

import Foundation
import OpenAPIRuntime
@testable import ITunesSearchClient

// A mock client used in previews and tests to avoid making live network calls.
struct MockClient: APIProtocol {
    var resultMediaType: String?
    
    func getByBundleId(_ input: Operations.getByBundleId.Input) async throws -> Operations.getByBundleId.Output {
        switch resultMediaType {
        case "text_javascript":
            let data = try JSONEncoder().encode(MockObjects.appResponse)
            let body = HTTPBody(data)
            return .ok(.init(body: .text_javascript(body)))
        case "json":
            return .ok(.init(body: .json(MockObjects.appResponse)))
        default:
            return .default(statusCode: 500, .init())
        }
    }
}
