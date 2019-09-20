//
//  PostCellViewModelTests.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange

class PostCellViewModelTests: XCTestCase {

    func testGIVEN_CellViewModelIsFavoriteWHEN_favoriteImage_THEN_ResultMatchesFavOn() {
        // GIVEN
        let cellViewModel = PostCellViewModel(model: Post.fake(), isFavorite: true)

        // WHEN
        let image = cellViewModel.favoriteImage

        // THEN
        XCTAssertEqual(UIImage(imageLiteralResourceName: "favOn"), image)
    }

    func testGIVEN_CellViewModelNoFavorite_WHEN_favoriteImage_THEN_ResultMatchesFavOff() {
        // GIVEN
        let cellViewModel = PostCellViewModel(model: Post.fake(), isFavorite: false)

        // WHEN
        let image = cellViewModel.favoriteImage

        // THEN
        XCTAssertEqual(UIImage(imageLiteralResourceName: "favOff"), image)
    }

    func testGIVEN_CellViewModelNoFavorite_WHEN_toggleFavoritAndGetFavoriteImage_THEN_ResultMatchesFavOn() {
        // GIVEN
        var cellViewModel = PostCellViewModel(model: Post.fake(), isFavorite: false)
        cellViewModel.isFavorite.toggle()

        // WHEN
        let image = cellViewModel.favoriteImage

        // THEN
        XCTAssertEqual(UIImage(imageLiteralResourceName: "favOn"), image)
    }

}
