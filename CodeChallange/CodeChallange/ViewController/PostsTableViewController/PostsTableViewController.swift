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
    
    init(networking: Networking,
        userController: UserController
        ) {
        self.viewModel = PostsViewModel(networking: networking)
        self.cellViewModels = []
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
        viewModel.getCellViewModels { [weak self] cellViewModels in
            self?.cellViewModels = cellViewModels
            self?.tableView.reloadData()
        }
    }

    // MARK: - Protocol UITableDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "FallBackCell")
        cell.textLabel?.text = "Fallback Cell"
        return cell
    }

    // MARK: - public
    
    // MARK: - private
    
    private let viewModel: PostsViewModel
    private var cellViewModels: [PostCellViewModel]
    
    private func setupTableView() {
        
    }
    
}
