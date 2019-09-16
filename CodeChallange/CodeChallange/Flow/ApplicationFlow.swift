//
//  ApplicationFlow.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import UIKit

class ApplicationFlow: UINavigationController {

    // MARK: - init
    init() {
        self.userController = UserController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not supported")
    }
    
    // MARK: - overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentLoginViewController()
    }

    // MARK: - Protocol <#Name#>
    
    // MARK: - public
    
    // MARK: - private
    
    private let userController: UserController
    
    private func presentLoginViewController() {
        if ( userController.isLoggedIn) {
            showPostsTableViewController()
        } else {
            let loginViewController = LoginViewController(userController:  userController, didLogin: { [weak self] in
                self?.showPostsTableViewController()
                self?.dismiss(animated: true)
            })
            
            present(loginViewController, animated: true)
        }
    }
    
    private func showPostsTableViewController() {
        let postsTableViewController = PostsTableViewController()
        setViewControllers([postsTableViewController], animated: false)
    }

}
