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
        self.postNetworkPorviding = Networking(webservice: WebService(), userController: userController)
        // Todo load fav from disk
        self.favoritesProviding = Favorites(favorites: [ Post(userId: 1, id: 1, title: "Testdata", body: "Das ist ein Test") ])
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
    private let postNetworkPorviding: Networking
    private let favoritesProviding: Favorites
    
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
        let postsTableViewController = PostsTableViewController(dataProvider: favoritesProviding)
        setViewControllers([postsTableViewController], animated: false)
    }
    
    private func showCommentsViewController(post: Int) {
        
    }

}
