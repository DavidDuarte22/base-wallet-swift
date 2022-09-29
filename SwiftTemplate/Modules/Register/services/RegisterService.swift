//
//  RegisterService.swift
//  SwiftTemplate
//
//  Created by David Duarte for Alkemy on 27/9/22.
//

import Foundation

struct RegisterService {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension RegisterService: RegisterFetcher {
    func registerUser(name: String, user: String, password: String) async -> Bool {
        let requestData = RegisterRequest.registerUser(name: name, user: user, password: password)
        do {
            // solo es un ejemplo. es parte de una tarea... verificar parametros que se le pasa, url, host, etc.
            let _: String = try await requestManager.perform(requestData)
            // TODO: Save token
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
