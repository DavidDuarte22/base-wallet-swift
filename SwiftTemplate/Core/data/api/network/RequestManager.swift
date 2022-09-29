//
//  RequestManager.swift
//  SwiftTemplate
//
//  Created by David Duarte for Alkemy on 27/9/22.
//

import Foundation

protocol RequestManagerProtocol {
    
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
    
}

class RequestManager: RequestManagerProtocol {
    
    let apiManager: ApiManagerProtocol
    let parser: DataParserProtocol
    let accessTokenManager: AccessTokenManagerProtocol
    
    // Set up the initializer and set apiManager with a default value.
    init(
        apiManager: ApiManagerProtocol = ApiManager(),
        parser: DataParserProtocol = DataParser(),
        accessTokenManager: AccessTokenManagerProtocol = AccessTokenManager()
    ) {
        self.apiManager = apiManager
        self.parser = parser
        self.accessTokenManager = accessTokenManager
    }
    
    func perform<T: Decodable>(_ request: RequestProtocol)
    async throws -> T {
        // You get the authentication token and store it in authToken.
        let authToken = try await requestAccessToken()
        // Then, you pass the authentication token to the perform(_:) of the APIManager object to add it to the URLRequest.
        let data = try await apiManager.perform(request,
                                                authToken: authToken)
        
        // Xecode and return the result of parsing data into the specific T type.
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
    
    func requestAccessToken() async throws -> String {
        // TODO: Check if token is valid or empty
        return accessTokenManager.fetchToken()
    }
}
