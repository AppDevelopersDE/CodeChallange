//
//  PostsTableViewController.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    // MARK: - init
    
    init(dataProvider: GetPostsProtocol, favoritesProvider: MutatePostsProtocol? = nil) {
        self.viewModel = PostsViewModel(dataProvider: dataProvider, favoritesProvider: favoritesProvider)
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not supported")
    }
    
    // MARK: - overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadCellViewModels { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - Protocol UITableDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else {
            NSLog("ne cell found to dequeue - PostTableViewCell")
            return UITableViewCell(style: .default, reuseIdentifier: "FallbackCell")
        }
        
        let cellViewModel = viewModel.getPostCellViewModel(at: indexPath.row)
        cell.configure(viewModel: cellViewModel, didTapFavoriteButton: { [weak self] in
            guard let self = self else {
                NSLog("Something went wrong while create strong self")
                return
            }
            self.viewModel.toggleFavorite(cellViewModel)
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        })
        return cell
    }

    // MARK: - public
    
    // MARK: - private
    
    private let viewModel: PostsViewModel
    
    private func setupTableView() {
        
        tableView.estimatedRowHeight = 65.0
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
    }
    
}
