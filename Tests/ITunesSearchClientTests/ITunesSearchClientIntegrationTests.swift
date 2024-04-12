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
//  ITunesSearchClientIntegrationTests.swift
//  
//
//  Created by Mykhailo Bondarenko on 07.04.2024.
//

import XCTest
@testable import ITunesSearchClient

final class ITunesSearchClientIntegrationTests: XCTestCase {
    func testByBundleId() async throws {
        let client = try ITunesSearchClient()
        let result = try await client.fetchAppInfo(by: "com.apple.Keynote", "us")
        XCTAssertEqual(result.bundleId, "com.apple.Keynote")
        XCTAssertNotNil(result.version)
        XCTAssertNotNil(result.currentVersionReleaseDate)
    }
}
