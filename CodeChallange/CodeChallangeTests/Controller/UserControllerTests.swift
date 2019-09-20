//
//  UserControllerTests.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import XCTest
@testable import CodeChallange

class UserControllerTests: XCTestCase {

    func testGIVEN_UserController_WHEN_IsLoggedIn_THEN_ResultIsFalse() {
        // GIVEN
        let userController = UserController()

        // WHEN
        let isLoggedIn = userController.isLoggedIn

        // THEN
        XCTAssertFalse(isLoggedIn)
    }

    func testGIVEN_UserControllerUserLogin_WHEN_IsLoggedIn_THEN_ResultIsTrue() {
        // GIVEN
        let userController = UserController()

        // WHEN
        userController.login(id: 1, name: "Test")
        let isLoggedIn = userController.isLoggedIn

        // THEN
        XCTAssertTrue(isLoggedIn)
    }

    func testGIVEN_UserControllerUserLogin_WHEN_getUserID_THEN_ResultIsEqualToLoginUserID() {
        // GIVEN
        let userController = UserController()

        // WHEN
        userController.login(id: 1, name: "Test")
        let userId = userController.userId

        // THEN
        XCTAssertEqual(1, userId)
    }

    func testGIVEN_UserControllerUserLoginAndLogout_WHEN_IsLoggedIn_THEN_ResultIsFalse() {
        // GIVEN
        let userController = UserController()

        // WHEN
        userController.login(id: 1, name: "Test")
        userController.logout()
        let isLoggedIn = userController.isLoggedIn

        // THEN
        XCTAssertFalse(isLoggedIn)
    }


}
