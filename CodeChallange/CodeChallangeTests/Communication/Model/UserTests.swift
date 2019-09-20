//
//  UserTests.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange


class UserTests: XCTestCase {

    func testGIVEN_User_THEN_ResultIsCorrectInitialized() {
        // GIVEN
        let user = User.fake()

        // THEN
        XCTAssertEqual(1, user.id)
        XCTAssertEqual("Kai", user.name)
    }

}
