//
//  Champion.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Champion: Decodable {
    
    public var id: ChampionId
    public var freeToPlay: Bool
    public var enabled: Bool
    public var rankedEnabled: Bool
    public var customBotEnabled: Bool
    public var coopBotEnabled: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case freeToPlay = "freeToPlay"
        case enabled = "active"
        case rankedEnabled = "rankedPlayEnabled"
        case customBotEnabled = "botEnabled"
        case coopBotEnabled = "botMmEnabled"
    }
    
    public init(id: ChampionId, freeToPlay: Bool, enabled: Bool, rankedEnabled: Bool, customBotEnabled: Bool, coopBotEnabled: Bool) {
        self.id = id
        self.freeToPlay = freeToPlay
        self.enabled = enabled
        self.rankedEnabled = rankedEnabled
        self.customBotEnabled = customBotEnabled
        self.coopBotEnabled = coopBotEnabled
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try ChampionId(container.decode(Long.self, forKey: .id))
        self.freeToPlay = try container.decode(Bool.self, forKey: .freeToPlay)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.rankedEnabled = try container.decode(Bool.self, forKey: .rankedEnabled)
        self.customBotEnabled = try container.decode(Bool.self, forKey: .customBotEnabled)
        self.coopBotEnabled = try container.decode(Bool.self, forKey: .coopBotEnabled)
    }
}
