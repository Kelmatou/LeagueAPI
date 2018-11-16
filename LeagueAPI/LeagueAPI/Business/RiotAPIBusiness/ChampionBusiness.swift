//
//  ChampionBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionBusiness {
    
    public static func getChampion<RiotModel: Decodable>(method: ChampionMethod.ChampionMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let championMethod: ChampionMethod = ChampionMethod(method: method, region: region)
        let championBusiness: APIBusiness = APIBusiness(key: key, method: championMethod)
        championBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
