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
        let methodUrl: String = method.getMethodUrl()
        print("Requesting: \(methodUrl)")
    }
}
