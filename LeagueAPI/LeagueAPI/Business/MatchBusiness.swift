//
//  MatchBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class MatchBusiness {
    
    public static func getMatch<RiotModel: Decodable>(method: MatchMethod.MatchMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let matchMethod: MatchMethod = MatchMethod(method: method, region: region)
        let matchBusiness: APIBusiness = APIBusiness(key: key, method: matchMethod)
        matchBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
