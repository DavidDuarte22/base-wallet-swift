//
//  ApiManager.swift
//  SwiftTemplate
//
//  Created by David Duarte for Alkemy on 27/9/22.
//

import Foundation

protocol ApiManagerProtocol {
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data
    func requestToken() async throws -> Data
}

class ApiManager: ApiManagerProtocol {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: RequestProtocol,
                 authToken: String = "") async throws -> Data {
        // URLSession.data(for:) uses async/await to process a request and return data and an URLResponse. Here you used try because it can also throw an error.
        let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
        // You check if the response code is 200. If this condition passes, data is returned.
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            // If their response isn’t successful, you return invalidServerResponse. NetworkError is a custom error enumeration and part of the starter project. A custom error enumeration makes it easier to customize the thrown error with meaningful messages.
            throw NetworkError.invalidServerResponse
        }
        return data
        
    }
    
    
    func requestToken() async throws -> Data {
        
        try await perform(AuthTokenRequest.auth())
    }
}
