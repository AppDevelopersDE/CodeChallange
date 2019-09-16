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
    
    init() {
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not supported")
    }
    
    // MARK: - overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
    }

    // MARK: - Protocol UITableDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "FallBackCell")
        cell.textLabel?.text = "Fallback Cell"
        return cell
    }

    // MARK: - public
    
    // MARK: - private
    
}
