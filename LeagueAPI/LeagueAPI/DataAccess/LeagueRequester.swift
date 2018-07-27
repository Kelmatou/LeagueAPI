//
//  LeagueRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class LeagueRequester<RiotModel: Decodable> {
    
    private var key: APIKey
    
    public init(key: APIKey) {
        self.key = key
    }
    
    internal func request(method: LeagueMethod, handler: @escaping (RiotModel?, String?) -> Void) {
        if canMakeRequest(for: method) {
            let accessMethod: RESTRequester.AccessMethod = method.getAccessMethod()
            let methodUrl: String = method.getMethodUrl()
            let headers: [String: String] = ["X-Riot-Token": self.key.token]
            Logger.print("Requesting: \(methodUrl)")

            RESTRequester.requestObject(accessMethod, url: methodUrl, headers: headers, asType: RiotModel.self) { (result, error) in
                handler(result, error)
            }
        }
        else {
            handler(nil, "Cannot make request for now")
        }
    }
    
    private func canMakeRequest(for method: LeagueMethod) -> Bool {
        let methodSignature: String = method.getMethodSignature()
        return self.key.hasReachLimit(for: methodSignature)
    }
}
