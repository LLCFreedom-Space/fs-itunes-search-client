//
//  ITunesSearchClientError.swift
//  
//
//  Created by Mykhailo Bondarenko on 12.04.2024.
//

import Foundation

/// An enumeration of errors that may occur during interactions with the iTunes Search API.
public enum ITunesSearchClientError: Error {
    /// A server-side error occurred, indicated by the provided status code.
    case serverError(errorCode: Int)
    /// No results were found for the specified bundle ID and country code.
    case notFound
}
