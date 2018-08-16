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
    public var tags: [String]
    public var ressourceType: RessourceType
    public var stats: ChampionStats
    public var difficulties: ChampionDifficulties
    public var version: String
    
    public var images: SkinImages? {
        return skins.first?.skinImages
    }
    
    public init(championId: ChampionId, name: String, title: String, skins: [Skin], presentationText: String, lore: String, tags: [String], ressourceType: RessourceType, stats: ChampionStats, difficulties: ChampionDifficulties, version: String) {
        self.championId = championId
        self.name = name
        self.title = title
        self.skins = skins
        self.presentationText = presentationText
        self.lore = lore
        self.tags = tags
        self.ressourceType = ressourceType
        self.stats = stats
        self.difficulties = difficulties
        self.version = version
    }
    
    internal init(version: String, details: ChampionsDetails, additionalDetails: ChampionAdditionalDetails) {
        self.championId = details.championId
        self.name = details.name
        self.title = details.title
        self.skins = additionalDetails.skinsData.map {
            return Skin(from: $0, version: version, championNameId: details.championIdName)
        }
        self.presentationText = details.presentationText
        self.lore = additionalDetails.lore
        self.tags = details.tags
        self.ressourceType = details.ressourceType
        self.stats = details.stats
        self.difficulties = details.difficulties
        self.version = version
    }
}
