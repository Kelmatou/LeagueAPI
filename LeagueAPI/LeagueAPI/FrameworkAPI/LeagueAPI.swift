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
    
    // MARK: - Summoner
    
    public func getSummonerByAccountId(id: Double, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        getSummoner(method: .ByAccountId(id: id), region: region) { (summoner, error) in
            handler(summoner, error)
        }
    }
    
    public func getSummonerByName(name: String, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        getSummoner(method: .ByName(name: name), region: region) { (summoner, error) in
            handler(summoner, error)
        }
    }
    
    public func getSummonerById(id: Double, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        getSummoner(method: .ById(id: id), region: region) { (summoner, error) in
            handler(summoner, error)
        }
    }
    
    // MARK: - Private
    
    private func getSummoner(method: SummonerMethod.SummonerMethods, region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        let summonerMethod: SummonerMethod = SummonerMethod(method: method, region: region)
        let summonerBusiness: SummonerBusiness = SummonerBusiness(key: self.key, method: summonerMethod)
        summonerBusiness.request() { (summonner, error) in
            handler(summonner, error)
        }
    }
}
