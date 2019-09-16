//
//  Networking.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

//struct Post: Codable {
//    let id: Int
//}

final public class Networking {
    
    // MARK: - init
    
    init(webservice: WebService, userController: UserController) {
        self.webservice = webservice
        self.userController = userController
    }
    
    // MARK: - overrides
    
    // MARK: - public
    
    public func getUserPosts(success: @escaping ([Post]) -> Void, failed: () -> Void) {
        let endpoint = CommunicationEndpoints.postsByUser(5)
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
