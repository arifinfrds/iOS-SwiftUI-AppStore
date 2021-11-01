//
//  LoadTodayItemsUseCaseTests.swift
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
	private let httpClient: HTTPClient

	init(httpClient: HTTPClient) {
		self.httpClient = httpClient
	}

	func load(completion: (Result<[TodayItem], Error>) -> Void) {
		let sampleURL = URL(string: "any-url.com")!
		httpClient.get(from: sampleURL) { _ in }
	}
}

class LoadTodayItemsUseCaseTests: XCTestCase {

	func test_load_executeGetMethodFromHTTPClient() {
		let sampleURL = URL(string: "any-url.com")!
		let client = HTTPClientSpy()
		let sut = RemoteTodayItemsLoader(httpClient: client)

		sut.load { _ in }

		XCTAssertEqual(client.messages, [ .get(sampleURL) ])
	}

	// MARK: - Helpers

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
