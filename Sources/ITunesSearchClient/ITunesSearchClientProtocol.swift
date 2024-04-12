//
//  ITunesSearchClientProtocol.swift
//  
//
//  Created by Mykhailo Bondarenko on 12.04.2024.
//

import Foundation

/// A protocol defining the contract for searching the iTunes App Store.
public protocol ITunesSearchClientProtocol {
    /// Fetches information about an app based on its bundle ID and optional country code.
    ///
    /// - Parameters:
    ///   - bundleId: The unique identifier of the app in the App Store.
    ///   - countryCode: The two-letter code representing the country to search in (optional). Defaults to nil.
    /// - Throws:
    ///   - ITunesSearchClientError: An error that may occur during the search process.
    /// - Returns: An `AppInfo` object containing details about the retrieved app.
    func fetchAppInfo(by bundleId: String, _ countryCode: String?) async throws -> AppInfo
}
