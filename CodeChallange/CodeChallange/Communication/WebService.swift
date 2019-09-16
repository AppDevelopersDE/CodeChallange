//
//  WebService.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

final class WebService {
    
    // MARK: - init
    
    // MARK: - overrides
    
    // MARK: - Protocol <#Name#>
    
    // MARK: - public
    
    func load<B>(resource: Resource<B>, completion: @escaping (B) -> Void, failed:((Resource<B>) -> Void)? = nil ) {
        let request = URLRequest(resource: resource)
        NSLog("Request ", request.httpMethod!, (request.url?.absoluteString)!.removingPercentEncoding!)
        
        if request.httpBody != nil {
            let bodyString = String(data: request.httpBody!, encoding: .utf8)!
            NSLog("Body: ", bodyString)
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, _) in
            if let response = response as? HTTPURLResponse {
                NSLog("Response: \(response.statusCode)")
                switch response.statusCode {
                case 200...204:
                    guard let data = data,
                        let responseModel = resource.decode(data) else {
                            failed?(resource)
                            return
                    }
                    DispatchQueue.main.async {
                        completion(responseModel)
                    }
                    
                default:
                        failed?(resource)
                }
            }
            }.resume()
    }
}
