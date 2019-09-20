//
//  Post+Fake.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation
@testable import CodeChallange

extension Post {
    static func fake(userId: Int = 1, id: Int = 2, title: String = "Test Title", body: String = "this is the boyd text") -> Post {
        return Post(userId: userId, id: id, title: title, body: body)
    }
}
