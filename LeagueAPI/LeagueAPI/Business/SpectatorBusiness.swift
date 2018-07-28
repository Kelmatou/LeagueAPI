//
//  SpectatorBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class SpectatorBusiness {
    
    public static func getCurrentGame<RiotModel: Decodable>(method: SpectatorMethod.SpectatorMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let spectatorMethod: SpectatorMethod = SpectatorMethod(method: method, region: region)
        let spectatorBusiness: APIBusiness = APIBusiness(key: key, method: spectatorMethod)
        spectatorBusiness.request() { (status, error) in
            handler(status, error)
        }
    }
}
