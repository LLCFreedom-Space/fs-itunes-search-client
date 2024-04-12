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
//  ITunesSearchClientTests.swift
//
//
//  Created by Mykhailo Bondarenko on 07.04.2024.
//

import XCTest
import OpenAPIRuntime
@testable import ITunesSearchClient

final class ITunesSearchClientTests: XCTestCase {
    func testGetJson() async throws {
        var mockClient = MockClient()
        mockClient.resultMediaType = "json"
        let client = ITunesSearchClient(client: mockClient)
        let result = try await client.fetchAppInfo(by: "com.apple.Keynote", "us")
        XCTAssertEqual(result.bundleId, "com.apple.Keynote")
        XCTAssertEqual(result.version, "14.0")
        XCTAssertEqual(result.currentVersionReleaseDate, "2024-04-02T15:31:46Z")
    }
    
    func testGetJsonNotFound() async throws {
        var mockClient = MockClient()
        mockClient.resultMediaType = "json"
        let client = ITunesSearchClient(client: mockClient)
        do {
            _ = try await client.fetchAppInfo(by: "com.apple.Some")
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertEqual(error.localizedDescription, ITunesSearchClientError.notFound.localizedDescription)
        }
    }
    
    func testGetServerError() async throws {
        let mockClient = MockClient()
        let client = ITunesSearchClient(client: mockClient)
        do {
            _ = try await client.fetchAppInfo(by: "error")
            XCTFail("Expected error not thrown")
        } catch {
            let errorCode = 500
            XCTAssertEqual(error.localizedDescription, ITunesSearchClientError.serverError(errorCode: errorCode).localizedDescription)
        }
    }

    func testGetTextJavascript() async throws {
        var mockClient = MockClient()
        mockClient.resultMediaType = "text_javascript"
        let client = ITunesSearchClient(client: mockClient)
        let result = try await client.fetchAppInfo(by: "com.apple.Keynote", "us")
        XCTAssertEqual(result.bundleId, "com.apple.Keynote")
    }
    
    func testGetTextJavascriptNotFound() async throws {
        var mockClient = MockClient()
        mockClient.resultMediaType = "text_javascript"
        let client = ITunesSearchClient(client: mockClient)
        do {
            _ = try await client.fetchAppInfo(by: "com.apple.Some")
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertEqual(error.localizedDescription, ITunesSearchClientError.notFound.localizedDescription)
        }
    }
}
