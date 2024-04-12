# FSITunesSearchClient

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
![GitHub release (with filter)](https://img.shields.io/github/v/release/LLCFreedom-Space/fs-itunes-search-client)
 [![Read the Docs](https://readthedocs.org/projects/docs/badge/?version=latest)](https://llcfreedom-space.github.io/fs-itunes-search-client/)
![example workflow](https://github.com/LLCFreedom-Space/fs-itunes-search-client/actions/workflows/docc.yml/badge.svg?branch=main)
![example workflow](https://github.com/LLCFreedom-Space/fs-itunes-search-client/actions/workflows/lint.yml/badge.svg?branch=main)
![example workflow](https://github.com/LLCFreedom-Space/fs-itunes-search-client/actions/workflows/test.yml/badge.svg?branch=main)
 [![codecov](https://codecov.io/github/LLCFreedom-Space/fs-itunes-search-client/graph/badge.svg?token=2EUIA4OGS9)](https://codecov.io/github/LLCFreedom-Space/fs-itunes-search-client)

This Swift package provides a client library for interacting with the iTunes Search API. It leverages the power of [Swift OpenAPI Generator](https://github.com/apple/swift-openapi-generator/tree/main) to automatically generate code from the provided OpenAPI specification file (openapi.yaml).

## Features

* Fetch app information by bundle ID and optional country code.
* Handles different response formats (JSON and JSONP).
* Throws informative errors for server errors and not found cases.

## Installation

1. Add the package dependency to your Package.swift file:

```swift
dependencies: [
.package(url: "https://github.com/LLCFreedom-Space/fs-itunes-search-client", from: "1.0.0")
]
```

2. Import the library in your Swift code:

```swift
import ITunesSearchClient
```

## Usage

Here's an example of how to use the ITunesSearchClient to fetch information about an app:

```swift
let client = try ITunesSearchClient()

do {
let appInfo = try await client.fetchAppInfo(by: "com.example.MyApp")
print("App Version: \(appInfo.version ?? "Not available")")
print("Bundle ID: \(appInfo.bundleId!)")
// ... access other properties of AppInfo
} catch {
print("Error fetching app info: \(error)")
}
```

## Contributions

We welcome contributions to this project! Please feel free to open issues or pull requests to help improve the package.

## Links

LLC Freedom Space – [@LLCFreedomSpace](https://twitter.com/llcfreedomspace) – [support@freedomspace.company](mailto:support@freedomspace.company)

Distributed under the GNU AFFERO GENERAL PUBLIC LICENSE Version 3. See [LICENSE.md][license-url] for more information.

 [GitHub](https://github.com/LLCFreedom-Space)

[swift-image]:https://img.shields.io/badge/swift-5.8-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-GPLv3-blue.svg
[license-url]: LICENSE
