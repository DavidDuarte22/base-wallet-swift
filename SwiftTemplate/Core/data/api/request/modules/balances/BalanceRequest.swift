//
//  BalanceRequest.swift
//  SwiftTemplate
//
//  Created by David Duarte for Alkemy on 27/9/22.
//

import Foundation

enum BalanceRequest: RequestProtocol {
case getBalance
    
    var path: String {
        // TODO: url to login
        ""
    }
    var requestType: RequestType {
        .GET
    }
}
