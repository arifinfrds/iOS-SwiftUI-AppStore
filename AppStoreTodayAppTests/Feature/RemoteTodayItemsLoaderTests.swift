//
//  RemoteTodayItemsLoaderTests.swift
//  AppStoreTodayAppTests
//
//  Created by Arifin Firdaus on 01/11/21.
//

import XCTest

protocol HTTPClient {
	func get(from url: URL, completion: ((Data, HTTPURLResponse)) -> Void)
}

struct TodayItem {
	let category: String
	let title: String
	let subtitle: String
	let imageURL: URL
}

protocol TodayItemsLoader {
	func load(completion: (Result<[TodayItem], Error>) -> Void)
}

final class RemoteTodayItemsLoader: TodayItemsLoader {
	private let url: URL
	private let httpClient: HTTPClient

	init(url: URL, httpClient: HTTPClient) {
		self.url = url
		self.httpClient = httpClient
	}

	func load(completion: (Result<[TodayItem], Error>) -> Void) {
		httpClient.get(from: url) { _ in }
	}
}

class RemoteTodayItemsLoaderTests: XCTestCase {

	func test_load_executeGetMethodFromHTTPClient() {
		let givenURL = anyURL()
		let client = HTTPClientSpy()
		let sut = RemoteTodayItemsLoader(url: givenURL, httpClient: client)

		sut.load { _ in }

		XCTAssertEqual(client.messages, [ .get(givenURL) ])
	}

	func test_loadTwice_executeTwice() {
		let givenURL = anyURL()
		let client = HTTPClientSpy()
		let sut = RemoteTodayItemsLoader(url: givenURL, httpClient: client)

		sut.load { _ in }
		sut.load { _ in }

		XCTAssertEqual(client.messages, [ .get(givenURL), .get(givenURL) ])
	}

	// MARK: - Helpers

	private func anyURL() -> URL {
		URL(string: "any-url.com")!
	}

	private class HTTPClientSpy: HTTPClient {

		var messages = [Message]()

		enum Message: Equatable {
			case get(URL)
		}

		func get(from url: URL, completion: ((Data, HTTPURLResponse)) -> Void) {
			messages.append(.get(url))
		}
	}

}
