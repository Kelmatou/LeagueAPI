//
//  Summoner.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Summoner: Decodable {
    
    public var id: Double
    public var accountId: Double
    public var name: String
    public var level: Double
    public var iconId: Int
    public var revisionDate: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case accountId = "accountId"
        case name = "name"
        case level = "summonerLevel"
        case iconId = "profileIconId"
        case revisionDate = "revisionDate"
    }
    
    public init(id: Double, accountId: Double, name: String, level: Double, iconId: Int, revisionDate: Double) {
        self.id = id
        self.accountId = accountId
        self.name = name
        self.level = level
        self.iconId = iconId
        self.revisionDate = revisionDate
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Double.self, forKey: .id)
        self.accountId = try container.decode(Double.self, forKey: .accountId)
        self.name = try container.decode(String.self, forKey: .name)
        self.level = try container.decode(Double.self, forKey: .level)
        self.iconId = try container.decode(Int.self, forKey: .iconId)
        self.revisionDate = try container.decode(Double.self, forKey: .revisionDate)
    }
}
