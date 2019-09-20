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
    init(userController: UserController, networkingProvider: PostsNetworking, favoritesProvider: PostsFavorites) {
        self.userController = userController
        self.networkingProvider = networkingProvider
        self.favoritesProvider = favoritesProvider
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
    private let networkingProvider: PostsNetworking
    private let favoritesProvider: PostsFavorites
    
    private func presentLoginViewController() {
        if ( userController.isLoggedIn) {
            presentTabBarController()
        } else {
            let loginViewController = LoginViewController(userController:  userController, didLogin: { [weak self] in
                self?.dismiss(animated: true, completion: {
                    self?.presentTabBarController()
                })
            })
            
            present(loginViewController, animated: true)
        }
    }
    
    private func presentTabBarController() {
        let postsTableViewController = PostsTableViewController(dataProvider: networkingProvider, favoritesProvider: favoritesProvider)
        postsTableViewController.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(imageLiteralResourceName: "tabIconPosts"), selectedImage: nil)
        
        let favoritesTableViewController = PostsTableViewController(dataProvider: favoritesProvider)
        favoritesTableViewController.tabBarItem = UITabBarItem(title: "Fovorites", image: UIImage(imageLiteralResourceName: "tabIconFav"), selectedImage: nil)
        
        let postNavigationController = UINavigationController(rootViewController: postsTableViewController)
        let favoritesNavigationControler = UINavigationController(rootViewController: favoritesTableViewController)
        
        let tabbarController = UITabBarController(nibName: nil, bundle: nil)
        tabbarController.viewControllers = [postNavigationController, favoritesNavigationControler]

        guard let window = UIApplication.shared.delegate?.window else {
            fatalError("window not fond - stop")
        }
        window?.rootViewController = tabbarController
    }

}
