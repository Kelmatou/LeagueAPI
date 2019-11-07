//
//  TFTMatchBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTMatchBusiness {
    
    public static func getMatch<RiotModel: Decodable>(method: TFTMatchMethod.TFTMatchMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let matchMethod: TFTMatchMethod = TFTMatchMethod(method: method, region: region)
        let matchBusiness: APIBusiness = APIBusiness(key: key, method: matchMethod)
        matchBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
