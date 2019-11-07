//
//  TFTRankedBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTRankedBusiness {
    
    public static func getRankedEntry(in queue: Queue, method: TFTRankedMethod.TFTRankedMethods, region: Region, key: APIKey, handler: @escaping (RankedEntry?, String?) -> Void) {
        let completion: ([RankedEntry]?, String?) -> Void = { (positionList, error) in
            handler(positionList?.filter { position in position.queue.type.rawValue == queue.type.rawValue }.first ?? nil, error)
        }
        getRanked(method: method, region: region, key: key, handler: completion)
    }
    
    public static func getRanked<RiotModel: Decodable>(method: TFTRankedMethod.TFTRankedMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let rankedMethod: TFTRankedMethod = TFTRankedMethod(method: method, region: region)
        let rankedBusiness: APIBusiness = APIBusiness(key: key, method: rankedMethod)
        rankedBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
