//
//  TFTCompanion.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTCompanion: Decodable {
    
    public var skinId: CompanionSkinId
    public var contentId: String
    public var species: String
    
    enum CodingKeys: String, CodingKey {
        case skinId = "skin_ID"
        case contentId = "content_ID"
        case species = "species"
    }
    
    public init(skinId: CompanionSkinId, contentId: String, species: String) {
        self.skinId = skinId
        self.contentId = contentId
        self.species = species
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.skinId = try CompanionSkinId(container.decode(Long.self, forKey: .skinId))
        self.contentId = try container.decode(String.self, forKey: .contentId)
        self.species = try container.decode(String.self, forKey: .species)
    }
}
