//
//  Networking.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

protocol MutatingPostProviding: PostsProviding {
    
    func addPost(_ post: Post)
    func deletePost(_ post: Post)
    
}

protocol PostsProviding {
    
    func getPosts(success: @escaping ([Post]) -> Void, failed: () -> Void)
    
}

final public class Networking: PostsProviding {
    
    // MARK: - init
    
    init(webservice: WebService, userController: UserController) {
        self.webservice = webservice
        self.userController = userController
    }
    
    // MARK: - overrides
    
    // MARK: - public
    
    public func getPosts(success: @escaping ([Post]) -> Void, failed: () -> Void) {
        guard let userID = userController.userId else {
            failed()
            return
        }
        let endpoint = CommunicationEndpoints.postsByUser(userID)
        guard let resource = Resource<[Post]>(url: endpoint.url) else {
            failed()
            return
        }
        
        webservice.load(resource: resource, completion: success) { (resource) in
            NSLog("Failed to load resource")
        }
    }
    
    // MARK: - private

    private let webservice: WebService
    private let userController: UserController
    
}
