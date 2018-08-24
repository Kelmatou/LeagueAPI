//
//  ChampionPassiveData.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionPassiveData: Decodable {
    
    public var name: String
    public var description: String
    public var imageName: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case image = "image"
        case imageName = "full"
    }
    
    public init(name: String, description: String, imageName: String) {
        self.name = name
        self.description = description
        self.imageName = imageName
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        let image = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .image)
        self.imageName = try image.decode(String.self, forKey: .imageName)
    }
}
