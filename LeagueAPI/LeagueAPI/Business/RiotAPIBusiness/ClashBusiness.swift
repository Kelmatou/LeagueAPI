//
//  ClashBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

internal class ClashBusiness {

    public static func getClashData<RiotModel: Decodable>(method: ClashMethod.ClashMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let clashMethod: ClashMethod = ClashMethod(method: method, region: region)
        let clashBusiness: APIBusiness = APIBusiness(key: key, method: clashMethod)
        clashBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
