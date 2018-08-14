//
//  ChampionsDetails.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionsDetails: Decodable {
    
    public var championId: ChampionId
    public var name: String
    public var title: String
    public var presentationText: String
    public var image: ChampionImage
    public var tags: [String]
    public var ressourceType: RessourceType
    public var stats: ChampionStats
    public var difficulties: ChampionDifficulties
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case championId = "key"
        case name = "name"
        case title = "title"
        case presentationText = "blurb"
        case image = "image"
        case tags = "tags"
        case ressourceType = "partype"
        case stats = "stats"
        case difficulties = "info"
    }
    
    public init(championId: ChampionId, name: String, title: String, presentationText: String, image: ChampionImage, tags: [String], ressourceType: RessourceType, stats: ChampionStats, difficulties: ChampionDifficulties) {
        self.championId = championId
        self.name = name
        self.title = title
        self.presentationText = presentationText
        self.image = image
        self.tags = tags
        self.ressourceType = ressourceType
        self.stats = stats
        self.difficulties = difficulties
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.championId = try ChampionId(container.decode(String.self, forKey: .championId))!
        self.name = try container.decode(String.self, forKey: .name)
        self.title = try container.decode(String.self, forKey: .title)
        self.presentationText = try container.decode(String.self, forKey: .presentationText)
        self.image = try container.decode(ChampionImage.self, forKey: .image)
        self.image.version = try container.decode(String.self, forKey: .version)
        self.tags = try container.decode([String].self, forKey: .tags)
        let ressourceTypeStr: String = try container.decode(String.self, forKey: .ressourceType)
        self.ressourceType = RessourceType(ressourceTypeStr)
        self.stats = try container.decode(ChampionStats.self, forKey: .stats)
        self.difficulties = try container.decode(ChampionDifficulties.self, forKey: .difficulties)
    }
}
