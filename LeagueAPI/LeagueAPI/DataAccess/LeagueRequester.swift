//
//  LeagueRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class LeagueRequester {
    
    private var key: APIKey
    
    public init(key: APIKey) {
        self.key = key
    }
    
    public func request(method: LeagueMethod) {
        if canMakeRequest(for: method) {
            let methodUrl: String = method.getMethodUrl()
            print("Requesting: \(methodUrl)")
        }
        else {
            print("Cannot make request for now")
        }
    }
    
    private func canMakeRequest(for method: LeagueMethod) -> Bool {
        let methodSignature: String = method.getMethodSignature()
        return self.key.hasReachLimit(for: methodSignature)
    }
}
