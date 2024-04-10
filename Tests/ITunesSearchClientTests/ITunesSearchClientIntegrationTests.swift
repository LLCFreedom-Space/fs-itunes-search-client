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
        let result = try await client.fetchAppInfo(by: "com.apple.Keynote")
        XCTAssertEqual(result.bundleId, "com.apple.Keynote")
        XCTAssertNotNil(result.version)
        XCTAssertNotNil(result.currentVersionReleaseDate)
    }
}
