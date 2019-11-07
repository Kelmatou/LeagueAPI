//
//  TFTTrait.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTTrait: Decodable {
    
    public var maxTier: Int
    public var name: String
    public var currentTier: Int
    public var unitNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case maxTier = "tier_total"
        case name = "name"
        case currentTier = "tier_current"
        case unitNumber = "num_units"
    }
    
    public init(maxTier: Int, name: String, currentTier: Int, unitNumber: Int) {
        self.maxTier = maxTier
        self.name = name
        self.currentTier = currentTier
        self.unitNumber = unitNumber
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maxTier = try container.decode(Int.self, forKey: .maxTier)
        self.name = try container.decode(String.self, forKey: .name)
        self.currentTier = try container.decode(Int.self, forKey: .currentTier)
        self.unitNumber = try container.decode(Int.self, forKey: .unitNumber)
    }
}
