//
//  AuthTokenRequest.swift
//  SwiftTemplate
//
//  Created by David Duarte for Alkemy on 27/9/22.
//

import Foundation

enum AuthTokenRequest: RequestProtocol {
case auth(user: String = "", pass: String = "")
    var path: String {
        // TODO: url to login
        ""
    }
    // TODO: check params to login
    var params: [String: String?] {
        switch self {
        case let .auth(user, pass):
            var params: [String: String] = [:]
            params["user"] = user
            params["pass"] = pass
            return params
        }
    }
    // Since it’s the authentication token fetch request itself, addAuthorizationToken is false.
    var addAuthorizationToken: Bool {
        false
    }
    // For this request, requestType needs to be POST.
    var requestType: RequestType {
        .POST
    }
}
