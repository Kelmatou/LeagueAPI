//
//  RiotAccountBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class RiotAccountBusiness {
    
    public static func getAccountInfo<RiotModel: Decodable>(method: RiotAccountMethod.RiotAccountMethods, region: WorldRegion, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let riotAccountMethod: RiotAccountMethod = RiotAccountMethod(method: method, region: region)
        let riotAccountBusiness: APIBusiness = APIBusiness(key: key, method: riotAccountMethod)
        riotAccountBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
