//
//  SkinData.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class SkinData: Decodable {
    
    public var skinId: SkinId
    public var skinNumber: Int
    public var name: String
    public var hasChromas: Bool
    
    enum CodingKeys: String, CodingKey {
        case skinId = "id"
        case skinNumber = "num"
        case name = "name"
        case hasChromas = "chromas"
    }
    
    public init(skinId: SkinId, skinNumber: Int, name: String, hasChromas: Bool) {
        self.skinId = skinId
        self.skinNumber = skinNumber
        self.name = name
        self.hasChromas = hasChromas
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.skinId = try SkinId(container.decode(String.self, forKey: .skinId))
        self.skinNumber = try container.decode(Int.self, forKey: .skinNumber)
        self.name = try container.decode(String.self, forKey: .name)
        self.hasChromas = try container.decode(Bool.self, forKey: .hasChromas)
    }
}
