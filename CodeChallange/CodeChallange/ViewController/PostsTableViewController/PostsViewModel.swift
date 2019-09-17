//
//  PostsViewModel.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 17.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

final public class PostsViewModel {
    
    // MARK: - init
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    // MARK: - overrides
    
    // MARK: - Protocol <#Name#>
    
    // MARK: - public
    
    public func getCellViewModels(completion: @escaping ([PostCellViewModel]) -> Void) {
        networking.getUserPosts(
            success: { (postModels) in
                completion(postModels.map { PostCellViewModel(model: $0) })
        },
            failed: {
                NSLog("We have no data - use an empty array for the moment")
                completion([])
            }
        )
    }
    
    // MARK: - private
    
    private let networking: Networking
    
}
