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
//  AppInfo.swift
//
//
//  Created by Mykhailo Bondarenko on 12.04.2024.
//

import Foundation

/// A model representing information about an app retrieved from the iTunes App Store.
public struct AppInfo {
    /// The version of the app.
    public let version: String?
    /// The bundle ID of the app.
    public let bundleId: String?
    /// The date the current version of the app was released.
    public let currentVersionReleaseDate: String?
    
    /// Initializes a new `AppInfo` instance from a `Components.Schemas.Result` object.
    ///
    /// - Parameter result: The `Components.Schemas.Result` object containing the app information.
    init(_ result: Components.Schemas.Result) {
        self.version = result.version
        self.bundleId = result.bundleId
        self.currentVersionReleaseDate = result.currentVersionReleaseDate
    }
    
    /// Initializes a new `AppInfo` instance with optional parameters.
    /// - Parameters:
    ///   - version: The version of the app.
    ///   - bundleId: The bundle ID of the app.
    ///   - currentVersionReleaseDate: The date the current version of the app was released in ISO 8601 format (YYYY-MM-DD).
    public init(
        version: String? = nil,
        bundleId: String? = nil,
        currentVersionReleaseDate: String? = nil
    ) {
        self.version = version
        self.bundleId = bundleId
        self.currentVersionReleaseDate = currentVersionReleaseDate
    }
}
