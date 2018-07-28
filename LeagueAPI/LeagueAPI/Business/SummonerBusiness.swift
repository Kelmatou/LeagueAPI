//
//  SummonerBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class SummonerBusiness {
    
    public static func getSummoner(method: SummonerMethod.SummonerMethods, region: Region, key: APIKey, handler: @escaping (Summoner?, String?) -> Void) {
        let summonerMethod: SummonerMethod = SummonerMethod(method: method, region: region)
        let summonerBusiness: APIBusiness = APIBusiness(key: key, method: summonerMethod)
        summonerBusiness.request() { (summoner, error) in
            handler(summoner, error)
        }
    }
}
