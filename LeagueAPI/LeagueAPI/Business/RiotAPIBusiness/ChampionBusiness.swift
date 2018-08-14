//
//  ChampionBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionBusiness {
    
    public static func getChampionList(method: ChampionMethod.ChampionMethods, region: Region, key: APIKey, handler: @escaping ([Champion]?, String?) -> Void) {
        let completion: (ChampionList?, String?) -> Void = { (championList, error) in
            handler(championList?.champions ?? nil, error)
        }
        getChampion(method: method, region: region, key: key, handler: completion)
    }
    
    public static func getChampion<RiotModel: Decodable>(method: ChampionMethod.ChampionMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let championMethod: ChampionMethod = ChampionMethod(method: method, region: region)
        let championBusiness: APIBusiness = APIBusiness(key: key, method: championMethod)
        championBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
