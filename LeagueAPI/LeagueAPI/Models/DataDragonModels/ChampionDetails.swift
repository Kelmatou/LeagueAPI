//
//  ChampionDetails.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionDetails {
    
    public var championId: ChampionId
    public var name: String
    public var title: String
    public var skins: [Skin]
    public var presentationText: String
    public var lore: String
    public var image: ChampionImage
    public var tags: [String]
    public var ressourceType: RessourceType
    public var stats: ChampionStats
    public var difficulties: ChampionDifficulties
    
    public init(championId: ChampionId, name: String, title: String, skins: [Skin], presentationText: String, lore: String, image: ChampionImage, tags: [String], ressourceType: RessourceType, stats: ChampionStats, difficulties: ChampionDifficulties) {
        self.championId = championId
        self.name = name
        self.title = title
        self.skins = skins
        self.presentationText = presentationText
        self.lore = lore
        self.image = image
        self.tags = tags
        self.ressourceType = ressourceType
        self.stats = stats
        self.difficulties = difficulties
    }
    
    internal init(details: ChampionsDetails, additionalDetails: ChampionAdditionalDetails) {
        self.championId = details.championId
        self.name = details.name
        self.title = details.title
        self.skins = additionalDetails.skins
        self.presentationText = details.presentationText
        self.lore = additionalDetails.lore
        self.image = details.image
        self.tags = details.tags
        self.ressourceType = details.ressourceType
        self.stats = details.stats
        self.difficulties = details.difficulties
    }
}
