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
        thirdPartyCodeBusiness.request() { (code: String?, error: String?) in
            // Riot API returns verification code into double quotes, but we want to return the exact string entered by the player
            let cleanCode: String? = ThirdPartyCodeBusiness.removeExtraDoubleQuotes(code)
            handler(cleanCode, error)
        }
    }
    
    internal static func removeExtraDoubleQuotes(_ receivedCode: String?) -> String? {
        guard let receivedCodeUnwrapped = receivedCode, receivedCodeUnwrapped.count >= 2 else { return receivedCode }
        return receivedCodeUnwrapped.substring(startIndex: 1, length: receivedCodeUnwrapped.count - 2)
    }
}
