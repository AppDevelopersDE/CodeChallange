//
//  Endpoints.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

enum CommunicationEndpoints {
    
    case allPosts
    case postsByUser(Int)
    
    var url: URL {
        guard let baseURL = URL(string: "https://jsonplaceholder.typicode.com") else {
            fatalError("Problem with URL")
        }
        
        switch self {
        case .allPosts:
            guard let url = URL(string: "/posts", relativeTo: baseURL) else {
                fatalError("Problem with URL")
            }
            return url
            
        case .postsByUser(let userId):
            guard let url = URL(string: String(format: "/posts?userId=%i", userId), relativeTo: baseURL) else {
                fatalError("Problem with URL")
            }
            return url
        }
    }

}
