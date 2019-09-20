//
//  LoginViewController.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - init
    
    init(userController: UserController, didLogin: @escaping () -> Void) {
        self.userController = userController
        self.didLogin = didLogin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not supported")
    }
    
    // MARK: - overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    // MARK: - public
    
    // MARK: - private
    
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet weak var userIdTextFiled: UITextField!
    
    private let userController: UserController
    private let didLogin: () -> Void

    private func setupButtons() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(didHitLoginButton), for: .touchUpInside)
    }
    
    @objc private func didHitLoginButton() {
        guard let idString = userIdTextFiled.text,
            let userId = Int(idString) else {
            NSLog("No interger found in Textfiled")
            return
        }
        
        
        userController.login(id: userId, name: "Mustermann")
        didLogin()
    }
    
}
