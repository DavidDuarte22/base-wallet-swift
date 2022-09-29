//
//  RegisterViewModel.swift
//  SwiftTemplate
//
//  Created by David Duarte for Alkemy on 27/9/22.
//

import Foundation

protocol RegisterFetcher {
    func registerUser(name: String, user: String, password: String) async -> Bool
}

class RegisterViewModel {
    
    private let registerFetcher: RegisterFetcher
    
    init(registerFetcher: RegisterFetcher) {
        self.registerFetcher = registerFetcher
    }
    
    func registerUser(name: String, user: String, password: String) async {
        let registerStatus = await registerFetcher.registerUser(name: name, user: user, password: password)
        registerStatus ? print("Register success") : print("Register failed")
        // TODO: Notify to view
    }
}
