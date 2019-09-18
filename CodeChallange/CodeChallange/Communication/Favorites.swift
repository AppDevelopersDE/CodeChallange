//
//  Filesystem.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 18.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

final public class Favorites: MutatingPostProviding {
    
    // MARK: - init
    
    init(favorites: [Post]) {
        self.favorites = favorites
    }
    
    // MARK: - overrides
    
    // MARK: - Protocol PostsProviding
    
    func getPosts(success: @escaping ([Post]) -> Void, failed: () -> Void) {
        success(favorites)
    }
    
    // MARK: - Protocol PostsProviding

    func addPost(_ post: Post) {
        if !favorites.contains(post) {
            favorites.append(post)
        }
    }
    
    func deletePost(_ post: Post) {
        if let index = favorites.firstIndex(of: post) {
            favorites.remove(at: index)
        }
    }
    
    func contains(_ post: Post) -> Bool {
        return favorites.firstIndex(of: post) != nil
    }
    
    func jsonData() -> Data? {
        let jsonEncoder = JSONEncoder()
        return try? jsonEncoder.encode(favorites)
    }
    
    // MARK: - public
    
    // MARK: - private
    private var favorites: [Post]
    
}
