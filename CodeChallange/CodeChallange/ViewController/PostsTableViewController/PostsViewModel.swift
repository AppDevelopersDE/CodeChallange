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
    
    init(dataProvider: PostsProviding, favoritesProvider: MutatingPostProviding? = nil) {
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
    
    public func toggleFavorite(_ viewModel: PostCellViewModel) {
        guard let favoritesProvider = favoritesProvider,
            let index = cellViewModels.firstIndex(of: viewModel) else {
            return
        }
        
        var modifyedViewModel = viewModel
        
        let post = viewModel.model
        if favoritesProvider.contains(post) {
            deleteFavorite(post)
            modifyedViewModel.isFavorite = false
        } else {
            addFavorite(post)
            modifyedViewModel.isFavorite = true
        }

        cellViewModels[index] = modifyedViewModel
    }
    
    // MARK: - private
    
    private let dataProvider: PostsProviding
    private let favoritesProvider: MutatingPostProviding?

    private var cellViewModels: [PostCellViewModel]

    private func addFavorite(_ post: Post) {
        favoritesProvider?.addPost(post)
        NSLog("reload tableView")
    }
    
    private func deleteFavorite(_ post: Post) {
        favoritesProvider?.deletePost(post)
        NSLog("reload tableView")
    }

}
