//
//  ITunesSearchClientIntegrationTests.swift
//  
//
//  Created by Mykhailo Bondarenko on 07.04.2024.
//

import XCTest
@testable import ITunesSearchClient

final class ITunesSearchClientIntegrationTests: XCTestCase {
    func testFetchBundleIDs() async throws {
        let client = try ITunesSearchClient()
        let bundleIDs = try await client.fetchBundleIdentifiers(bundleId: "com.apple.Pages")
        XCTAssertEqual(["com.apple.Pages"], bundleIDs)
    }
}
