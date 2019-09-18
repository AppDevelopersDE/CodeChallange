//
//  PostCellViewModel.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 17.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation
import UIKit

public struct PostCellViewModel {
    
    // MARK: - init
    
    init(model: Post) {
        self.body = model.body
        self.title = model.title
        // TODO fav state
        self.favoriteImage = UIImage(imageLiteralResourceName: "favOn")
    }
    
    // MARK: - overrides
    
    // MARK: - public
    
    let title: String
    let body: String
    let favoriteImage: UIImage
    
    // MARK: - private
    
}
