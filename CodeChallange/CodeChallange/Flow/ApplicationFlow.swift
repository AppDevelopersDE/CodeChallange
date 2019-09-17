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
        self.networking = Networking(webservice: WebService(), userController: userController)
        
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

    // MARK: - public
    
    // MARK: - private
    
    private let userController: UserController
    private let networking: Networking
    
    private func presentLoginViewController() {
        if ( userController.isLoggedIn) {
            showPostsTableViewController()
        } else {
            let loginViewController = LoginViewController(userController:  userController, didLogin: { [weak self] in
                self?.dismiss(animated: true, completion: {
                    self?.showPostsTableViewController()
                })
            })
            
            present(loginViewController, animated: true)
        }
    }
    
    private func showPostsTableViewController() {
        let postsTableViewController = PostsTableViewController(networking: networking, userController: userController)
        setViewControllers([postsTableViewController], animated: false)
    }
    
    private func showCommentsViewController(post: Int) {
        
    }

}
