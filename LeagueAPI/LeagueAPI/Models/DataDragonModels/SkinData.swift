//
//  SkinData.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class SkinData: Decodable {
    
    public var id: SkinId
    public var skinNumber: Int
    public var name: String
    public var hasChromas: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case skinNumber = "num"
        case name = "name"
        case hasChromas = "chromas"
    }
    
    public init(id: SkinId, skinNumber: Int, name: String, hasChromas: Bool) {
        self.id = id
        self.skinNumber = skinNumber
        self.name = name
        self.hasChromas = hasChromas
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try SkinId(container.decode(String.self, forKey: .id))
        self.skinNumber = try container.decode(Int.self, forKey: .skinNumber)
        self.name = try container.decode(String.self, forKey: .name)
        self.hasChromas = try container.decode(Bool.self, forKey: .hasChromas)
    }
}
