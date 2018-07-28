//
//  ChampionMasteryBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionMasteryBusiness {
    
    public static func getMastery<RiotModel: Decodable>(method: ChampionMasteryMethod.ChampionMasteryMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let championMasteryMethod: ChampionMasteryMethod = ChampionMasteryMethod(method: method, region: region)
        let championMasteryBusiness: APIBusiness = APIBusiness(key: key, method: championMasteryMethod)
        championMasteryBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
