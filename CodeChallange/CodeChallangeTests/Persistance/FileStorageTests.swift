//
//  FileStorageTests.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange

class FileStorageTests: XCTestCase {

    func testGIVEN_FileStorage_WHEN_Load_THEN_resultIsNil() {
        // GIVEN
        let storage = FileStorage.fake()

        // WHEN
        let data = storage.load()

        // THEN
        XCTAssertNil(data)
    }

    func testGIVEN_FileStorage_WHEN_SaveAndLoad_THEN_resultDataGiveIsERqualDataRead() {
        // GIVEN
        let storage = FileStorage.fake()
        let posts = [Post.fake(), Post.fake()]
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(posts)

        // WHEN
        storage.save(data: data)
        let readData = storage.load()

        // THEN
        XCTAssertEqual(data, readData)
    }

    func testGIVEN_FileStorage_WHEN_SaveDeleteLoad_THEN_resultIsNil() {
        // GIVEN
        let storage = FileStorage.fake()
        let posts = [Post.fake(), Post.fake()]
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(posts)

        // WHEN
        storage.save(data: data)
        storage.delete()
        let readData = storage.load()

        // THEN
        XCTAssertNil(readData)
    }


}
