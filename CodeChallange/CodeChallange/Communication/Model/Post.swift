//
//  Post.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

public struct Post: Codable, Equatable {
    
    // MARK: - init
    
    // MARK: - overrides
    
    // MARK: - public

    let userId: Int
    let id: Int
    let title: String
    let body: String

    // MARK: - private
}
