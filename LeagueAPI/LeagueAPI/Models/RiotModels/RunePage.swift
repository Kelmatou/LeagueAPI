//
//  RunePage.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class RunePage: Decodable {
    
    public var primaryPath: Int64
    public var secondaryPath: Int64
    public var runeIds: [Int64]
    
    enum CodingKeys: String, CodingKey {
        case primaryPath = "perkStyle"
        case secondaryPath = "perkSubStyle"
        case runeIds = "perkIds"
    }
    
    public init(primaryPath: Int64, secondaryPath: Int64, runeIds: [Int64]) {
        self.primaryPath = primaryPath
        self.secondaryPath = secondaryPath
        self.runeIds = runeIds
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primaryPath = try container.decode(Int64.self, forKey: .primaryPath)
        self.secondaryPath = try container.decode(Int64.self, forKey: .secondaryPath)
        self.runeIds = try container.decode([Int64].self, forKey: .runeIds)
    }
}
