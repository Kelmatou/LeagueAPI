//
//  Summoner.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Summoner: Decodable {
    
    public var id: SummonerId
    public var accountId: AccountId
    public var puuid: SummonerPuuid
    public var name: String
    public var level: Long
    public var iconId: ProfileIconId
    public var revisionDate: Datetime
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case accountId = "accountId"
        case puuid = "puuid"
        case name = "name"
        case level = "summonerLevel"
        case iconId = "profileIconId"
        case revisionDate = "revisionDate"
    }
    
    public init(id: SummonerId, accountId: AccountId, puuid: SummonerPuuid, name: String, level: Long, iconId: ProfileIconId, revisionDate: Datetime) {
        self.id = id
        self.accountId = accountId
        self.puuid = puuid
        self.name = name
        self.level = level
        self.iconId = iconId
        self.revisionDate = revisionDate
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try SummonerId(container.decode(String.self, forKey: .id))
        self.accountId = try AccountId(container.decode(String.self, forKey: .accountId))
        self.puuid = try SummonerPuuid(container.decode(String.self, forKey: .puuid))
        self.name = try container.decode(String.self, forKey: .name)
        self.level = try container.decode(Long.self, forKey: .level)
        self.iconId = try ProfileIconId(container.decode(Long.self, forKey: .iconId))
        let timestamp: Long = try container.decode(Long.self, forKey: .revisionDate)
        self.revisionDate = Datetime(timestamp: timestamp)
    }
}
