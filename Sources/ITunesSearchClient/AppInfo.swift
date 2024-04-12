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
}
