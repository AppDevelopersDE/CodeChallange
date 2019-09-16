//
//  ApplicationFlow.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import UIKit

class ApplicationFlow: UIViewController {

    // MARK: - init
    init(window: UIWindow?) {
        self.window = window
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not supported")
    }
    
    // MARK: - overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmptyViewController()
    }

    // MARK: - Protocol <#Name#>
    
    // MARK: - public
    
    // MARK: - private
    
    private let window: UIWindow?
    
    private func setupEmptyViewController() {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        window?.backgroundColor = .white
        window?.rootViewController = navigationController
    }

}
