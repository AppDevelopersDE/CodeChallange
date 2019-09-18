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
    
    init(
        dataProvider: PostsProviding,
        favoritesProvider: MutatingPostProviding? = nil
        ) {
        self.dataProvider = dataProvider
        self.favoritesProvider = favoritesProvider
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
        dataProvider.getPosts(
            success: { [weak self] (postModels) in
                guard let self = self else {
                    fatalError()
                }
                self.cellViewModels = postModels.map { PostCellViewModel(model: $0, isFavorite: self.favoritesProvider?.contains($0) ?? false)}
                completion()
            },
            failed: {
                NSLog("Somethong went wrong - we do not handle this at the moment")
                completion()
        }
        )
    }
    
    // MARK: - private
    
    private let dataProvider: PostsProviding
    private let favoritesProvider: MutatingPostProviding?

    private var cellViewModels: [PostCellViewModel]

}
