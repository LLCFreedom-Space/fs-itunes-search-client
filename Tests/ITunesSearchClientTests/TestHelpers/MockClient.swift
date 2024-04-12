// FS iTunes Search Client
// Copyright (C) 2024  FREEDOM SPACE, LLC

//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published
//  by the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
            let statusCode = 500
            return .default(statusCode: statusCode, .init())
        }
    }
}
