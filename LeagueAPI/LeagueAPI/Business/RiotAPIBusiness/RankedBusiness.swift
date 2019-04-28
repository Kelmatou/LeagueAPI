//
//  RankedBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class RankedBusiness {
    
    public static func getRankedEntry(in queue: Queue, method: RankedMethod.RankedMethods, region: Region, key: APIKey, handler: @escaping (RankedEntry?, String?) -> Void) {
        let completion: ([RankedEntry]?, String?) -> Void = { (positionList, error) in
            handler(positionList?.filter { position in position.queue.type.rawValue == queue.type.rawValue }.first ?? nil, error)
        }
        getRanked(method: method, region: region, key: key, handler: completion)
    }
    
    public static func getRanked<RiotModel: Decodable>(method: RankedMethod.RankedMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let rankedMethod: RankedMethod = RankedMethod(method: method, region: region)
        let rankedBusiness: APIBusiness = APIBusiness(key: key, method: rankedMethod)
        rankedBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
