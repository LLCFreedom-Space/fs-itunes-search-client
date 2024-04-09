//
//  ITunesSearchClientIntegrationTests.swift
//  
//
//  Created by Mykhailo Bondarenko on 07.04.2024.
//

import XCTest
@testable import ITunesSearchClient

final class ITunesSearchClientIntegrationTests: XCTestCase {
    func testFetchBundleIdentifiersetchBundleIDs() async throws {
        let client = try ITunesSearchClient()
        let bundleIDs = try await client.fetchBundleIdentifiers(by: "com.apple.Pages")
        XCTAssertEqual(["com.apple.Pages"], bundleIDs)
    }
    
    func testByBundleId() async throws {
        let client = try ITunesSearchClient()
        let result = try await client.get(by: "com.apple.Keynote")
        XCTAssertEqual(result.bundleId, "com.apple.Keynote")
        XCTAssertNotNil(result.version)
        XCTAssertNotNil(result.currentVersionReleaseDate)
    }
}
