//
//  Resource.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct Resource<B: Decodable> {
    
    // MARK: - init

    init!(url: URL, _ method: HttpMethod = .get) {
        self.url = url
        self.method = method
    }

    // MARK: - overrides
    
    // MARK: - public
    
    public let url: URL
    public let method: HttpMethod

    public func decode(_ data: Data) -> B? {
        do {
            return try jsonDecoder.decode(B.self, from: data)
        }
            
        catch DecodingError.keyNotFound(let key, let context) {
            NSLog("missing key: \(key)")
            NSLog("Debug Description: \(context.debugDescription)")
        }
            
        catch DecodingError.valueNotFound(let type, let context) {
            NSLog("Type not found \(type)")
            NSLog("Debug Description: \(context.debugDescription)")
        }
            
        catch DecodingError.typeMismatch(let type, let context) {
            NSLog("Type mismatch found \(type)")
            NSLog("Debug Description: \(context.debugDescription)")
        }
            
        catch DecodingError.dataCorrupted(let context) {
            NSLog("Debug Description: \(context.debugDescription)")
        }
            
        catch {
            fatalError("Failed to parse JSON answer")
        }
        
        return nil
    }

    // MARK: - private

    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

extension URLRequest {
    init<B>(resource: Resource<B>) {
        self.init(url: resource.url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 90.0)
        httpMethod = resource.method.rawValue
        setValue("application/json", forHTTPHeaderField: "Content-Type")
        setValue("no-cache", forHTTPHeaderField: "Cache-Control")
    }
}
