//
//  RunneteraMatchBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/11/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

internal class RunneteraMatchBusiness {

    public static func getMatchIds(method: RunneteraMatchMethod.RunneteraMatchMethods, region: WorldRegion, key: APIKey, handler: @escaping ([String]?, String?) -> Void) {
        let runneteraMatchMethod: RunneteraMatchMethod = RunneteraMatchMethod(method: method, region: region)
        let runneteraMatchBusiness: APIBusiness = APIBusiness(key: key, method: runneteraMatchMethod)
        runneteraMatchBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
    
    public static func getMatch<RiotModel: Decodable>(method: RunneteraMatchMethod.RunneteraMatchMethods, region: WorldRegion, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let runneteraMatchMethod: RunneteraMatchMethod = RunneteraMatchMethod(method: method, region: region)
        let runneteraMatchBusiness: APIBusiness = APIBusiness(key: key, method: runneteraMatchMethod)
        runneteraMatchBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
