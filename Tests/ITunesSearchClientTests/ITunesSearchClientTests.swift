import XCTest
import OpenAPIRuntime
@testable import ITunesSearchClient

final class ITunesSearchClientTests: XCTestCase {
    func testGetJson() async throws {
        var mockClient = MockClient()
        mockClient.resultMediaType = "json"
        let client = ITunesSearchClient(client: mockClient)
        let result = try await client.fetchAppInfo(by: "com.apple.Keynote", "us")
        XCTAssertEqual(result.bundleId, "com.apple.Keynote")
        XCTAssertEqual(result.version, "14.0")
        XCTAssertEqual(result.currentVersionReleaseDate, "2024-04-02T15:31:46Z")
    }
    
    func testGetJsonNotFound() async throws {
        var mockClient = MockClient()
        mockClient.resultMediaType = "json"
        let client = ITunesSearchClient(client: mockClient)
        do {
            _ = try await client.fetchAppInfo(by: "com.apple.Some")
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertEqual(error.localizedDescription, ITunesSearchClientError.notFound.localizedDescription)
        }
    }
    
    func testGetServerError() async throws {
        let mockClient = MockClient()
        let client = ITunesSearchClient(client: mockClient)
        do {
            _ = try await client.fetchAppInfo(by: "error")
            XCTFail("Expected error not thrown")
        } catch {
            let errorCode = 500
            XCTAssertEqual(error.localizedDescription, ITunesSearchClientError.serverError(errorCode: errorCode).localizedDescription)
        }
    }

    func testGetTextJavascript() async throws {
        var mockClient = MockClient()
        mockClient.resultMediaType = "text_javascript"
        let client = ITunesSearchClient(client: mockClient)
        let result = try await client.fetchAppInfo(by: "com.apple.Keynote", "us")
        XCTAssertEqual(result.bundleId, "com.apple.Keynote")
    }
    
    func testGetTextJavascriptNotFound() async throws {
        var mockClient = MockClient()
        mockClient.resultMediaType = "text_javascript"
        let client = ITunesSearchClient(client: mockClient)
        do {
            _ = try await client.fetchAppInfo(by: "com.apple.Some")
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertEqual(error.localizedDescription, ITunesSearchClientError.notFound.localizedDescription)
        }
    }
}
