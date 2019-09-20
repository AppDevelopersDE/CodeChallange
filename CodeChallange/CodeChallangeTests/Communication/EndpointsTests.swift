//
//  EndpointsTests.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange

class EndpointsTests: XCTestCase {

    func testGIVEN_CommunicationEndPoint_WHEN_allPosts_THEN_ResultIsCorrectURL() {
        // GIVEN
        let endpoint = CommunicationEndpoints.allPosts

        // WHEN
        let url = endpoint.url

        // THEN
        XCTAssertEqual(url, URL(string: "/posts", relativeTo: URL(string: "https://jsonplaceholder.typicode.com"))!)
    }

    func testGIVEN_CommunicationEndPoint_WHEN_postsByUser_THEN_ResultIsCorrectURL() {
        // GIVEN
        let endpoint = CommunicationEndpoints.postsByUser(5)

        // WHEN
        let url = endpoint.url

        // THEN
        XCTAssertEqual(url, URL(string: String(format: "/posts?userId=%i", 5), relativeTo: URL(string: "https://jsonplaceholder.typicode.com"))!)
    }

}
