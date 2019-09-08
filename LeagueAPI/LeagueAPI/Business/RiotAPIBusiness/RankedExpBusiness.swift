//
//  RankedExpBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 9/7/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class RankedExpBusiness {
    
    public static func getRankedExp<RiotModel: Decodable>(method: RankedExpMethod.RankedExpMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let rankedExpMethod: RankedExpMethod = RankedExpMethod(method: method, region: region)
        let rankedExpBusiness: APIBusiness = APIBusiness(key: key, method: rankedExpMethod)
        rankedExpBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
