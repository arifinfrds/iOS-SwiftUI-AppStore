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

	}
}

class LoadTodayItemsUseCaseTests: XCTestCase {

	func test_init() {
		let client = HTTPClientSpy()
		_ = RemoteTodayItemsLoader(httpClient: client)
	}

	// MARK: - Helpers

	private class HTTPClientSpy: HTTPClient {
		
		func get(from url: URL, completion: ((Data, HTTPURLResponse)) -> Void) {

		}
	}

}
