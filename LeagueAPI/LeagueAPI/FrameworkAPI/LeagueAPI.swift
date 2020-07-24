//
//  LeagueAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class LeagueAPI {
    
    public private(set) var riotAPI: RiotAPI
    public private(set) var lolAPI: LoLAPI
    public private(set) var lorAPI: LoRAPI
    public private(set) var tftAPI: TFTAPI
    
    private var apiKey: APIKey
    
    public init(APIToken: String) {
        self.apiKey = APIKey(token: APIToken)

        self.riotAPI = RiotAPI(apiKey: self.apiKey)
        self.lolAPI = LoLAPI(apiKey: self.apiKey)
        self.lorAPI = LoRAPI(apiKey: self.apiKey)
        self.tftAPI = TFTAPI(apiKey: self.apiKey)
    }
    
    public static func clearCache() {
        DataDragonRequester.clearCache()
    }
    
    public static func cancelAllDelayedRequests() {
        APIBusiness.cancelAllDelayedRequests()
    }
    
    public static func delayedRequestNumber() -> Int {
        return APIBusiness.delayedRequestNumber()
    }
}
