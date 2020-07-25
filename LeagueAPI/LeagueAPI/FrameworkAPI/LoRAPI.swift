//
//  LoRAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class LoRAPI: APIClient {
    
    // MARK: - Ranked
    
    public func getLeaderboard(on region: WorldRegion, handler: @escaping ([RunneteraPlayer]?, String?) -> Void) {
        RunneteraRankedBusiness.getLeaderboard(method: .GetLeaderboard, region: region, key: self.key, handler: handler)
    }
}
