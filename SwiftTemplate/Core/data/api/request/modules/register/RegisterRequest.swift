//
//  RegisterRequest.swift
//  SwiftTemplate
//
//  Created by David Duarte for Alkemy on 27/9/22.
//

import Foundation

enum RegisterRequest: RequestProtocol {
    case registerUser(name: String, user: String, password: String)
    
    var path: String {
        // TODO: url to register
        ""
    }
    
    // TODO: check params to register a new user
    var params: [String: Any] {
        switch self {
        case let .registerUser(name, user, password):
            
            var params: [String: String] = [:]
            params["name"] = name
            params["user"] = user
            params["pass"] = password
            return params
        }
    }
    
    var requestType: RequestType {
        .POST
    }
}
