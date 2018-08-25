//
//  RunePath.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/25/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class RunePath: Decodable {
    
    public var id: RunePathId
    public var nameId: String
    public var name: String
    public var image: ImageWithUrl
    public var runeStages: [RuneStage]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nameId = "key"
        case name = "name"
        case image = "icon"
        case runeStages = "slots"
    }
    
    public init(id: RunePathId, nameId: String, name: String, image: ImageWithUrl, runeStages: [RuneStage]) {
        self.id = id
        self.nameId = nameId
        self.name = name
        self.image = image
        self.runeStages = runeStages
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try RunePathId(container.decode(Long.self, forKey: .id))
        self.nameId = try container.decode(String.self, forKey: .nameId)
        self.name = try container.decode(String.self, forKey: .name)
        let pathToIcon: String = try container.decode(String.self, forKey: .image)
        self.image = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/img/\(pathToIcon)", image: nil)
        self.runeStages = try container.decode([RuneStage].self, forKey: .runeStages)
    }
}
