//
//  Filesystem.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 18.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

final public class PostsFavorites: MutatePostsProtocol {
    
    // MARK: - init
    
    public init(storage: FileStorage) {
        self.storage = storage

        let jsonDecoder = JSONDecoder()
        if let data = storage.load() {
            self.favorites = try! jsonDecoder.decode([Post].self, from: data)
        } else {
            NSLog("No data found on disc - let's init a ffresh one")
            self.favorites = []
        }
    }
    
    // MARK: - overrides
    
    // MARK: - Protocol GetPostsProtocol
    
    public func getPosts(success: @escaping ([Post]) -> Void, failed: () -> Void) {
        success(favorites)
    }
    
    // MARK: - Protocol GetPostsProtocol

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

    public func save() {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(favorites) else {
            NSLog("failed to create data")
            return
        }
        storage.save(data: data)
    }
    
    // MARK: - private
    private var favorites: [Post]
    private let storage: FileStorage
    
}
