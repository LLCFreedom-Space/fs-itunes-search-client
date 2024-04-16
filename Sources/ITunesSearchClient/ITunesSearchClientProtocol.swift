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
//  ITunesSearchClientProtocol.swift
//  
//
//  Created by Mykhailo Bondarenko on 12.04.2024.
//

import Foundation

/// A protocol defining the interface for searching the iTunes App Store.
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
