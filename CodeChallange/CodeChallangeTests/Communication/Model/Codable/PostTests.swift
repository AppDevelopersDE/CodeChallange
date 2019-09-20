//
//  PostTest.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange

class PostTests: XCTestCase {

    func testGIVEN_Post_THEN_ResultIsCorrectInitialized() {
        // GIVEN
        let post = Post.fake()

        // THEN
        XCTAssertEqual(post.userId, 1)
        XCTAssertEqual(post.id, 2)
        XCTAssertEqual(post.title, "Test Title")
        XCTAssertEqual(post.body, "this is the boyd text")
    }
}

