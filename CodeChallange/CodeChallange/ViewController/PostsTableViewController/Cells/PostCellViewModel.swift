//
//  PostCellViewModel.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 17.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation
import UIKit

public struct PostCellViewModel: Equatable {
    
    // MARK: - init
    
    public init(model: Post, isFavorite: Bool) {
        self.model = model
        self.body = model.body
        self.title = model.title
        self.isFavorite = isFavorite
    }
    
    // MARK: - overrides
    
    // MARK: - public
    
    public let model: Post
    public let title: String
    public let body: String
    
    public var isFavorite: Bool
    
    public var favoriteImage: UIImage {
        return UIImage(imageLiteralResourceName: isFavorite ? "favOn" : "favOff")
    }
    
    // MARK: - private
    
}
