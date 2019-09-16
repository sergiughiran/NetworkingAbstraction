//
//  Endpoint.swift
//  NetworkingAbstraction
//
//  Created by Ghiran Sergiu-Robert on 22/07/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]?
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}

extension Endpoint {
    
    /// Returns the endpoint used to log in the user
    /// - *email*: The user's email
    /// - *password*: The user's password
    static func logIn(email: String, password: String) -> Endpoint {
        return Endpoint(path: "/authenticate/logIn", queryItems: [
            URLQueryItem(name: "email", value: email),
            URLQueryItem(name: "password", value: password)
            ])
    }
    
    /// Returns the endpoint used to get all the comments
    static func comments() -> Endpoint {
        return Endpoint(path: "/comments", queryItems: nil)
    }
}


