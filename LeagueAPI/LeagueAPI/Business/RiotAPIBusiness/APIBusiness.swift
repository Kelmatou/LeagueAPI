//
//  APIBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class APIBusiness {
    
    private var key: APIKey
    private var method: LeagueMethod
    
    public init(key: APIKey, method: LeagueMethod) {
        self.key = key
        self.method = method
    }
    
    public static func cancelAllDelayedRequests() {
        LeagueRequester.cancelDelayedRequests()
    }
    
    public static func delayedRequestNumber() -> Int {
        return LeagueRequester.delayedRequestNumber()
    }
    
    public func request<DataType: Decodable>(handler: @escaping (DataType?, String?) -> Void) {
        let requester: LeagueRequester = LeagueRequester(key: self.key)
        requester.request(method: self.method) { (result, error) in
            handler(result, error)
        }
    }
}
