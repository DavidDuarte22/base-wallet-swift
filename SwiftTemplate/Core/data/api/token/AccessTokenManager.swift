//
//  UserManager.swift
//  SwiftTemplate
//
//  Created by David Duarte for Alkemy on 27/9/22.
//

import Foundation

// Use this class to save and retrieve the token get it in login.
// TODO: Implement keychain to save and retrieve.
protocol AccessTokenManagerProtocol {
    func saveUserToken(token: String) throws
    func fetchToken() -> String
}

class AccessTokenManager {
    
    private var accessToken: String?
    
}

extension AccessTokenManager: AccessTokenManagerProtocol {
    func saveUserToken(token: String) {
        // TODO: Save keychain/UserDefaults
    }
    
    func fetchToken() -> String {
        guard let token = accessToken else {
            return ""
        }
        return token
    }
}
