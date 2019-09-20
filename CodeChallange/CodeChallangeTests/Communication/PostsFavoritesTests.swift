//
//  PostsFavoritesTests.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange

class PostsFavoritesTests: XCTestCase {

    func testGIVEN_PostFavorites_WHEN_getPosts_THEN_ResultIsEqualToStorage() {
        // GIVEN
        let storage = FileStorage.fake()
        let posts = [Post.fake(), Post.fake(userId: 1, id: 25, title: "Hallo Welt", body: "das ist ein Test")]
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(posts)
        storage.save(data: data)

        let postsFavorites = PostsFavorites(storage: storage)

        // WHEN
        _ = postsFavorites.getPosts(success: { (postsResult) in

        // THEN
            XCTAssertEqual(postsResult, posts)
        }) {
            XCTFail()
        }
    }

    func testGIVEN_PostFavorites_WHEN_addPost_THEN_ResultIsOnePost() {
        // GIVEN
        let storage = FileStorage.fake()
        let postsFavorites = PostsFavorites(storage: storage)
        postsFavorites.addPost(Post.fake())

        // WHEN
        _ = postsFavorites.getPosts(success: { (postsResult) in

            // THEN
            XCTAssertEqual(postsResult, [Post.fake()])
        }) {
            XCTFail()
        }
    }

    func testGIVEN_PostFavorites_WHEN_deltePosts_THEN_ResultIsOnlyOneFake() {
        // GIVEN
        let storage = FileStorage.fake()
        let posts = [Post.fake(), Post.fake(userId: 1, id: 25, title: "Hallo Welt", body: "das ist ein Test")]
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(posts)
        storage.save(data: data)

        let postsFavorites = PostsFavorites(storage: storage)
        postsFavorites.deletePost(Post.fake(userId: 1, id: 25, title: "Hallo Welt", body: "das ist ein Test"))

        // WHEN
        _ = postsFavorites.getPosts(success: { (postsResult) in

            // THEN
            XCTAssertEqual(postsResult, [Post.fake()])
        }) {
            XCTFail()
        }
    }

    func testGIVEN_PostFavorites_WHEN_coontainPost_THEN_ResultIsTrue() {
        // GIVEN
        let storage = FileStorage.fake()
        let posts = [Post.fake(), Post.fake(userId: 1, id: 25, title: "Hallo Welt", body: "das ist ein Test")]
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(posts)
        storage.save(data: data)

        let postsFavorites = PostsFavorites(storage: storage)

        // WHEN
        let result = postsFavorites.contains(Post.fake(userId: 1, id: 25, title: "Hallo Welt", body: "das ist ein Test"))

        // THEN
        XCTAssertTrue(result)
    }


}
