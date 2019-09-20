//
//  User+Fake.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation
@testable import CodeChallange

extension User {
    static func fake(userId: Int = 1, name: String = "Kai") -> User {
        return User(id: userId, name: name)
    }
}
