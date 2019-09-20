//
//  ResourceTests.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange

class ResourceTests: XCTestCase {

    func testGIVEN_PostRecource_WHEN_getMethod_THEN_ResultIsGet() {
        // GIVEN
        let fakeURL = URL(string: "http://www.news.de")!
        let resource = Resource<Post>(url: fakeURL)

        // WHEN
        let method = resource?.method

        // THEN
        XCTAssertEqual(HttpMethod.get, method)
    }

    func testGIVEN_PostRecource_WHEN_getURL_THEN_ResultIsEqualGivenURL() {
        // GIVEN
        let fakeURL = URL(string: "http://www.news.de")!
        let resource = Resource<Post>(url: fakeURL)

        // WHEN
        let url = resource?.url

        // THEN
        XCTAssertEqual(fakeURL, url)
    }

    func testGIVEN_PostRecource_WHEN_decode_THEN_ResultIsEqualPostFake() {
        // GIVEN
        let fakeURL = URL(string: "http://www.news.de")!
        let resource = Resource<Post>(url: fakeURL)

        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(Post.fake())

        // WHEN
        let decodedPost = resource?.decode(data)

        // THEN
        XCTAssertEqual(Post.fake(), decodedPost)
    }



}
