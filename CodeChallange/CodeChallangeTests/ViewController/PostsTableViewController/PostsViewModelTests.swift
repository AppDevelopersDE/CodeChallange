//
//  PostsViewModelTests.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange


class PostsViewModelTests: XCTestCase {

    func testGIVEN_PostsViewModel_WHEN_loadAndCount_THEN_ResultIsEqualCountPostsGiven() {
        // GIVEN
        let storage = FileStorage.fake()
        let posts = [Post.fake(), Post.fake(userId: 1, id: 25, title: "Hallo Welt", body: "das ist ein Test")]
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(posts)
        storage.save(data: data)

        let postsFavorites = PostsFavorites(storage: storage)
        let viewModel = PostsViewModel(dataProvider: postsFavorites, favoritesProvider: postsFavorites)

        // WHEN
        viewModel.loadCellViewModels { }
        let count = viewModel.count

        // THEN
        XCTAssertEqual(count, posts.count)
    }

    func testGIVEN_PostsViewModel_WHEN_toggleFavorite_THEN_ResultCellViewModelIsFavoriteIsFalse() {
        // GIVEN
        let storage = FileStorage.fake()
        let posts = [Post.fake(), Post.fake(userId: 1, id: 25, title: "Hallo Welt", body: "das ist ein Test")]
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(posts)
        storage.save(data: data)

        let postsFavorites = PostsFavorites(storage: storage)
        let viewModel = PostsViewModel(dataProvider: postsFavorites, favoritesProvider: postsFavorites)

        // WHEN
        viewModel.loadCellViewModels { }
        let cellViewModel = viewModel.getPostCellViewModel(at: 1)
        viewModel.toggleFavorite(cellViewModel)

        let updatedCellVieModel = viewModel.getPostCellViewModel(at: 1)


        // THEN
        XCTAssertFalse(updatedCellVieModel.isFavorite)
    }



}
