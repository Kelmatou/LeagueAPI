//
//  RunneteraStatusBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/11/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraStatusBusiness {

    public static func getStatus<RiotModel: Decodable>(method: RunneteraStatusMethod.RunneteraStatusMethods, region: WorldRegion, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let runneteraStatusMethod: RunneteraStatusMethod = RunneteraStatusMethod(method: method, region: region)
        let runneteraStatusBusiness: APIBusiness = APIBusiness(key: key, method: runneteraStatusMethod)
        runneteraStatusBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
