//
//  RiotAccount.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class RiotAccount: Decodable {
    
    public var puuid: SummonerPuuid
    public var riotId: RiotId
    
    enum CodingKeys: String, CodingKey {
        case puuid = "puuid"
    }
    
    public init(puuid: SummonerPuuid, riotId: RiotId) {
        self.puuid = puuid
        self.riotId = riotId
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.puuid = try SummonerPuuid(container.decode(String.self, forKey: .puuid))
        self.riotId = try RiotId(from: decoder)
    }
}
