//
//  FileStorage+Fake.swift
//  CodeChallangeTests
//
//  Created by Kai-Marcel Teuber on 20.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation
import CodeChallange

extension FileStorage {

    static func fake() -> FileStorage {
        let storage = FileStorage(filename: "test.json")
        storage.delete()
        return storage
    }

}
