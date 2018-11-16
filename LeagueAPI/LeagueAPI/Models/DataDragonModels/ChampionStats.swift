//
//  ChampionStats.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ChampionStats: Decodable {
    
    public var health: Double
    public var healthPerLevel: Double
    public var healthRegen: Double
    public var healthRegenPerLevel: Double
    public var ressource: Double
    public var ressourcePerLevel: Double
    public var ressourceRegen: Double
    public var ressourceRegenPerLevel: Double
    public var attackDamage: Double
    public var attackDamagePerLevel: Double
    public var armor: Double
    public var armorPerLevel: Double
    public var magicResistance: Double
    public var magicResistancePerLevel: Double
    public var criticalChance: Double
    public var criticalChancePerLevel: Double
    public var attackSpeedOffset: Double?
    public var attackSpeedPerLevel: Double
    public var attackRange: Double
    public var movementSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case health = "hp"
        case healthPerLevel = "hpperlevel"
        case healthRegen = "hpregen"
        case healthRegenPerLevel = "hpregenperlevel"
        case ressource = "mp"
        case ressourcePerLevel = "mpperlevel"
        case ressourceRegen = "mpregen"
        case ressourceRegenPerLevel = "mpregenperlevel"
        case attackDamage = "attackdamage"
        case attackDamagePerLevel = "attackdamageperlevel"
        case armor = "armor"
        case armorPerLevel = "armorperlevel"
        case magicResistance = "spellblock"
        case magicResistancePerLevel = "spellblockperlevel"
        case criticalChance = "crit"
        case criticalChancePerLevel = "critperlevel"
        case attackSpeedOffset = "attackspeedoffset"
        case attackSpeedPerLevel = "attackspeedperlevel"
        case attackRange = "attackrange"
        case movementSpeed = "movespeed"
    }
    
    public init(health: Double, healthPerLevel: Double, healthRegen: Double, healthRegenPerLevel: Double, ressource: Double, ressourcePerLevel: Double, ressourceRegen: Double, ressourceRegenPerLevel: Double, attackDamage: Double, attackDamagePerLevel: Double, armor: Double, armorPerLevel: Double, magicResistance: Double, magicResistancePerLevel: Double, criticalChance: Double, criticalChancePerLevel: Double, attackSpeedOffset: Double?, attackSpeedPerLevel: Double, attackRange: Double, movementSpeed: Double) {
        self.health = health
        self.healthPerLevel = healthPerLevel
        self.healthRegen = healthRegen
        self.healthRegenPerLevel = healthRegenPerLevel
        self.ressource = ressource
        self.ressourcePerLevel = ressourcePerLevel
        self.ressourceRegen = ressourceRegen
        self.ressourceRegenPerLevel = ressourceRegenPerLevel
        self.attackDamage = attackDamage
        self.attackDamagePerLevel = attackDamagePerLevel
        self.armor = armor
        self.armorPerLevel = armorPerLevel
        self.magicResistance = magicResistance
        self.magicResistancePerLevel = magicResistancePerLevel
        self.criticalChance = criticalChance
        self.criticalChancePerLevel = criticalChancePerLevel
        self.attackSpeedOffset = attackSpeedOffset
        self.attackSpeedPerLevel = attackSpeedPerLevel
        self.attackRange = attackRange
        self.movementSpeed = movementSpeed
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.health = try container.decode(Double.self, forKey: .health)
        self.healthPerLevel = try container.decode(Double.self, forKey: .healthPerLevel)
        self.healthRegen = try container.decode(Double.self, forKey: .healthRegen)
        self.healthRegenPerLevel = try container.decode(Double.self, forKey: .healthRegenPerLevel)
        self.ressource = try container.decode(Double.self, forKey: .ressource)
        self.ressourcePerLevel = try container.decode(Double.self, forKey: .ressourcePerLevel)
        self.ressourceRegen = try container.decode(Double.self, forKey: .ressourceRegen)
        self.ressourceRegenPerLevel = try container.decode(Double.self, forKey: .ressourceRegenPerLevel)
        self.attackDamage = try container.decode(Double.self, forKey: .attackDamage)
        self.attackDamagePerLevel = try container.decode(Double.self, forKey: .attackDamagePerLevel)
        self.armor = try container.decode(Double.self, forKey: .armor)
        self.armorPerLevel = try container.decode(Double.self, forKey: .armorPerLevel)
        self.magicResistance = try container.decode(Double.self, forKey: .magicResistance)
        self.magicResistancePerLevel = try container.decode(Double.self, forKey: .magicResistancePerLevel)
        self.criticalChance = try container.decode(Double.self, forKey: .criticalChance)
        self.criticalChancePerLevel = try container.decode(Double.self, forKey: .criticalChancePerLevel)
        self.attackSpeedOffset = try? container.decode(Double.self, forKey: .attackSpeedOffset)
        self.attackSpeedPerLevel = try container.decode(Double.self, forKey: .attackSpeedPerLevel)
        self.attackRange = try container.decode(Double.self, forKey: .attackRange)
        self.movementSpeed = try container.decode(Double.self, forKey: .movementSpeed)
    }
}
