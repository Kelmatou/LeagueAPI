//
//  ChampionAdditionalDetails.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionAdditionalDetails {
    
    public var skins: [Skin]
    public var lore: String
    public var spells: [ChampionSpell]
    public var passive: ChampionPassive
    
    public init(skins: [Skin], lore: String, spells: [ChampionSpell], passive: ChampionPassive) {
        self.skins = skins
        self.lore = lore
        self.spells = spells
        self.passive = passive
    }
    
    public init(championAdditionalData: ChampionAdditionalDetailsData, version: String) {
        self.skins = championAdditionalData.skinsData.map {
            return Skin(from: $0, version: version, championNameId: championAdditionalData.championIdName)
        }
        self.lore = championAdditionalData.lore
        self.spells = championAdditionalData.spells.map {
            return ChampionSpell(from: $0, version: version)
        }
        self.passive = ChampionPassive(data: championAdditionalData.passive, version: version)
    }
}
