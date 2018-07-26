//
//  LeagueAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class LeagueAPI {
    
    private var key: APIKey
    
    public init(APIToken: String) {
        self.key = APIKey(token: APIToken)
    }
    
    public func request(method: LeagueMethod) {
        switch method {
        case is SummonerMethod:
            let summonerBusiness: SummonerBusiness = SummonerBusiness(key: self.key, method: method as! SummonerMethod)
            summonerBusiness.request()
        default:
            Logger.error("Unknown method type")
        }
    }
}
