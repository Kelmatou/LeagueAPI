//
//  SummonerSpell.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/23/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class SummonerSpell {
    
    public var id: SummonerSpellId
    public var nameId: String
    public var name: String
    public var description: String
    public var cooldown: Double
    public var range: Int
    public var unlockLevel: Int
    public var image: ImageWithUrl
    public var availableGameModes: [GameMode]
    
    public init(id: SummonerSpellId, nameId: String, name: String, description: String, cooldown: Double, range: Int, unlockLevel: Int, image: ImageWithUrl, availableGameModes: [GameMode]) {
        self.id = id
        self.nameId = nameId
        self.name = name
        self.description = description
        self.cooldown = cooldown
        self.range = range
        self.unlockLevel = unlockLevel
        self.image = image
        self.availableGameModes = availableGameModes
    }
    
    internal init(data: SummonerSpellData, version: String) {
        self.id = data.id
        self.nameId = data.nameId
        self.name = data.name
        self.description = data.description
        self.cooldown = data.cooldown
        self.range =  data.range
        self.unlockLevel = data.unlockLevel
        self.image = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/\(version)/img/spell/\(data.nameId).png", image: nil)
        self.availableGameModes = data.availableGameModes
    }
}
