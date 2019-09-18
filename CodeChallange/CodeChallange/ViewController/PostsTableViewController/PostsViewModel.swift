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
        self.cellViewModels = []
    }
    
    // MARK: - overrides
    
    // MARK: - Protocol <#Name#>
    
    // MARK: - public
    
    public var count: Int {
        return cellViewModels.count
    }
    
    public func getPostCellViewModel(at index: Int) -> PostCellViewModel {
        return cellViewModels[index]
    }
    
    public func loadCellViewModels(completion: @escaping () -> Void) {
        networking.getUserPosts(
            success: { [weak self] (postModels) in
                self?.cellViewModels = postModels.map { PostCellViewModel(model: $0) }
                completion()
            },
            failed: {
                NSLog("Somethong went wrong - we do not handle this at the moment")
                completion()
        }
        )
    }
    
    // MARK: - private
    
    private let networking: Networking
    private var cellViewModels: [PostCellViewModel]

}
