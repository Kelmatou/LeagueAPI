//
//  RunneteraDeckBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraDeckBusiness {

    
    public static func deckAction<RiotModel: Decodable>(method: RunneteraDeckMethod.RunneteraDeckMethods, region: WorldRegion, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let runneteraDeckMethod: RunneteraDeckMethod = RunneteraDeckMethod(method: method, region: region)
        let runneteraDeckBusiness: APIBusiness = APIBusiness(key: key, method: runneteraDeckMethod)
        runneteraDeckBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
