//
//  ChampionRotations.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionRotations: Decodable {
    
    public var rotation: [ChampionId]
    public var newPlayerRotation: [ChampionId]
    public var maxNewPlayerLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case rotation = "freeChampionIds"
        case newPlayerRotation = "freeChampionIdsForNewPlayers"
        case maxNewPlayerLevel = "maxNewPlayerLevel"
    }
    
    public init(rotation: [ChampionId], newPlayerRotation: [ChampionId], maxNewPlayerLevel: Int) {
        self.rotation = rotation
        self.newPlayerRotation = newPlayerRotation
        self.maxNewPlayerLevel = maxNewPlayerLevel
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rotation = try container.decode([Long].self, forKey: .rotation).map { ChampionId($0) }
        self.newPlayerRotation = try container.decode([Long].self, forKey: .newPlayerRotation).map { ChampionId($0) }
        self.maxNewPlayerLevel = try container.decode(Int.self, forKey: .maxNewPlayerLevel)
    }
}
