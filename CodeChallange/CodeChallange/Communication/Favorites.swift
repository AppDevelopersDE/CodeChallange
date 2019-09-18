//
//  Filesystem.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 18.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

final public class Favorites: PostsProviding {
    
    // MARK: - init
    
    init(favorites: [Post]) {
        self.favorites = favorites
        
    }
    
    // MARK: - overrides
    
    // MARK: - Protocol PostsProviding
    
    func getPosts(success: @escaping ([Post]) -> Void, failed: () -> Void) {
        success(favorites)
    }
    
    // MARK: - public
    
    // MARK: - private
    private var favorites: [Post]
    
}
