//
//  TFTSummonerBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTSummonerBusiness {
    
    public static func getSummoner(method: TFTSummonerMethod.TFTSummonerMethods, region: Region, key: APIKey, handler: @escaping (Summoner?, String?) -> Void) {
        let summonerMethod: TFTSummonerMethod = TFTSummonerMethod(method: method, region: region)
        let summonerBusiness: APIBusiness = APIBusiness(key: key, method: summonerMethod)
        summonerBusiness.request() { (summoner, error) in
            handler(summoner, error)
        }
    }
}
