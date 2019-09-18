//
//  PostTableViewCell.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 17.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - init
    
    // MARK: - overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favoriteButton.addTarget(self, action: #selector(didHitButton), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Protocol <#Name#>
    
    // MARK: - public
    
    public func configure(viewModel: PostCellViewModel, didTapFavoriteButton: @escaping () -> Void) {
        headlineLabel.text = viewModel.title
        bodyLabel.text = viewModel.body
        favoriteButton.setImage(viewModel.favoriteImage, for: .normal)
        self.didTapFavoriteButton = didTapFavoriteButton
    }
    
    public func updateFavoriteState(viewModel: PostCellViewModel) {
        favoriteButton.setImage(viewModel.favoriteImage, for: .normal)
    }
    
    // MARK: - private
    
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    private var didTapFavoriteButton: (() -> Void)?
    
    @objc private func didHitButton() {
        didTapFavoriteButton?()
    }
    
}
