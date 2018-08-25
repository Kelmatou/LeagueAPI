//
//  RunePage.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class RunePage: Decodable {
    
    public var primaryPath: RunePathId
    public var secondaryPath: RunePathId
    public var runeIds: [RuneId]
    
    enum CodingKeys: String, CodingKey {
        case primaryPath = "perkStyle"
        case secondaryPath = "perkSubStyle"
        case runeIds = "perkIds"
    }
    
    public init(primaryPath: RunePathId, secondaryPath: RunePathId, runeIds: [RuneId]) {
        self.primaryPath = primaryPath
        self.secondaryPath = secondaryPath
        self.runeIds = runeIds
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primaryPath = try RunePathId(container.decode(Long.self, forKey: .primaryPath))
        self.secondaryPath = try RunePathId(container.decode(Long.self, forKey: .secondaryPath))
        self.runeIds = try container.decode([Long].self, forKey: .runeIds).map { RuneId($0) }
    }
}
