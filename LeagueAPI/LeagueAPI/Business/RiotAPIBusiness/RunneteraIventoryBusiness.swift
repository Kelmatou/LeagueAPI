//
//  RunneteraIventoryBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraIventoryBusiness {

    public static func getInventory<RiotModel: Decodable>(method: RunneteraInventoryMethod.RunneteraInventoryMethods, region: WorldRegion, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let runneteraInventoryMethod: RunneteraInventoryMethod = RunneteraInventoryMethod(method: method, region: region)
        let runneteraInventoryBusiness: APIBusiness = APIBusiness(key: key, method: runneteraInventoryMethod)
        runneteraInventoryBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
