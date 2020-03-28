//
//  RunneteraRankedBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraRankedBusiness {
    
    public static func getLeaderboard(method: RunneteraRankedMethod.RunneteraRankedMethods, region: WorldRegion, key: APIKey, handler: @escaping ([RunneteraPlayer]?, String?) -> Void) {
        let completion: (RunneteraPlayerArray?, String?) -> Void = { (playerArray, error) in
            handler(playerArray?.players, error)
        }
        getRunneteraRanked(method: method, region: region, key: key, handler: completion)
    }
    
    public static func getRunneteraRanked<RiotModel: Decodable>(method: RunneteraRankedMethod.RunneteraRankedMethods, region: WorldRegion, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let runneteraRankedMethod: RunneteraRankedMethod = RunneteraRankedMethod(method: method, region: region)
        let runneteraRankedBusiness: APIBusiness = APIBusiness(key: key, method: runneteraRankedMethod)
        runneteraRankedBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
