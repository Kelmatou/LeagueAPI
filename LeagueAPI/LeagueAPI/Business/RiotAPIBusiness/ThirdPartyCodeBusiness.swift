//
//  ThirdPartyCodeBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ThirdPartyCodeBusiness {
    
    public static func getVerificationCode(method: ThirdPartyCodeMethod.ThirdPartyCodeMethods, region: Region, key: APIKey, handler: @escaping (String?, String?) -> Void) {
        let thirdPartyCodeMethod: ThirdPartyCodeMethod = ThirdPartyCodeMethod(method: method, region: region)
        let thirdPartyCodeBusiness: APIBusiness = APIBusiness(key: key, method: thirdPartyCodeMethod)
        thirdPartyCodeBusiness.request() { (code, error) in
            handler(code, error)
        }
    }
}
