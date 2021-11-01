//
//  RemoteTodayItemsLoaderTests.swift
//  AppStoreTodayAppTests
//
//  Created by Arifin Firdaus on 01/11/21.
//

import XCTest

protocol HTTPClient {
	typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
	func get(from url: URL, completion: @escaping (Result) -> Void)
}

struct TodayItem {
	let category: String
	let title: String
	let subtitle: String
	let imageURL: URL
}

protocol TodayItemsLoader {
	func load(completion: @escaping (Result<[TodayItem], Error>) -> Void)
}

final class RemoteTodayItemsLoader: TodayItemsLoader {
	private let url: URL
	private let httpClient: HTTPClient

	init(url: URL, httpClient: HTTPClient) {
		self.url = url
		self.httpClient = httpClient
	}

	func load(completion: @escaping (Result<[TodayItem], Error>) -> Void) {
		httpClient.get(from: url) { result in
			switch result {
			case let .failure(error):
				completion(.failure(error))
			default:
				break
			}
		}
	}
}

class RemoteTodayItemsLoaderTests: XCTestCase {

	func test_init_doesNotRequestWithURL() {
		let givenURL = anyURL()
		let (_, client) = makeSUT(url: givenURL)

		XCTAssertTrue(client.requestedURLs.isEmpty)
	}

	func test_load_executeGetMethodFromHTTPClient() {
		let givenURL = anyURL()
		let (sut, client) = makeSUT(url: givenURL)

		sut.load { _ in }

		XCTAssertEqual(client.requestedURLs, [ givenURL ])
	}

	func test_loadTwice_executeTwice() {
		let givenURL = anyURL()
		let (sut, client) = makeSUT(url: givenURL)

		sut.load { _ in }
		sut.load { _ in }

		XCTAssertEqual(client.requestedURLs, [ givenURL, givenURL ])
	}

	func test_load_deliversErrorOnClientError() {
		let givenURL = anyURL()
		let (sut, client) = makeSUT(url: givenURL)
		let clientError = anyNSError()
		var receivedError: NSError?
		let exp = expectation(description: "Wait for completion")

		sut.load { result in
			switch result {
			case let .failure(error):
				receivedError = error as NSError
			case let .success(items):
				XCTFail("Expect failure, but got success instead with items: \(items)")
			}
			exp.fulfill()
		}
		client.complete(with: clientError)
		
		wait(for: [exp], timeout: 0.1)

		XCTAssertEqual(receivedError!.domain, clientError.domain)
		XCTAssertEqual(receivedError!.code, clientError.code)
	}

	// MARK: - Helpers

	private func makeSUT(url: URL) -> (sut: RemoteTodayItemsLoader, client: HTTPClientSpy) {
		let client = HTTPClientSpy()
		let sut = RemoteTodayItemsLoader(url: url, httpClient: client)
		return (sut, client)
	}

	private func anyURL() -> URL {
		URL(string: "any-url.com")!
	}

	private func anyNSError() -> NSError {
		NSError(domain: "Error", code: 1)
	}

	private class HTTPClientSpy: HTTPClient {

		private var messages = [(url: URL, completion: (HTTPClient.Result) -> Void)]()

		var requestedURLs: [URL] {
			messages.map { $0.url }
		}

		func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) {
			messages.append((url, completion))
		}

		func complete(with error: Error, at index: Int = 0) {
			let message = messages[index]
			message.completion(.failure(error))
		}
	}

}
