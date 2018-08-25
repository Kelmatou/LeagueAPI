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
    public var spells: [ChampionSpell]
    public var passive: ChampionPassive
    public var presentationText: String
    public var lore: String
    public var roles: [ChampionRole]
    public var ressourceType: RessourceType
    public var stats: ChampionStats
    public var difficulties: ChampionDifficulties
    public var allyTips: [String]
    public var enemyTips: [String]
    
    public var images: SkinImages? {
        return skins.first?.skinImages
    }
    
    public init(championId: ChampionId, name: String, title: String, skins: [Skin], spells: [ChampionSpell], passive: ChampionPassive, presentationText: String, lore: String, roles: [ChampionRole], ressourceType: RessourceType, stats: ChampionStats, difficulties: ChampionDifficulties, allyTips: [String], enemyTips: [String]) {
        self.championId = championId
        self.name = name
        self.title = title
        self.skins = skins
        self.spells = spells
        self.passive = passive
        self.presentationText = presentationText
        self.lore = lore
        self.roles = roles
        self.ressourceType = ressourceType
        self.stats = stats
        self.difficulties = difficulties
        self.allyTips = allyTips
        self.enemyTips = enemyTips
    }
    
    internal init(details: ChampionsDetails, additionalDetails: ChampionAdditionalDetails) {
        self.championId = details.championId
        self.name = details.name
        self.title = details.title
        self.skins = additionalDetails.skins
        self.spells = additionalDetails.spells
        self.passive = additionalDetails.passive
        self.presentationText = details.presentationText
        self.lore = additionalDetails.lore
        self.roles = details.roles
        self.ressourceType = details.ressourceType
        self.stats = details.stats
        self.difficulties = details.difficulties
        self.allyTips = additionalDetails.allyTips
        self.enemyTips = additionalDetails.enemyTips
    }
}
