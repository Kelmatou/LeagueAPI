//
//  DDragonVersions.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DDragonVersions: Decodable {
    
    public var patch: String
    public var item: String
    public var rune: String
    public var mastery: String
    public var summoner: String
    public var champion: String
    public var profileIcon: String
    public var map: String
    public var language: String
    public var sticker: String
    
    enum CodingKeys: String, CodingKey {
        case entry = "n"
        case patch = "v"
        case item = "item"
        case rune = "rune"
        case mastery = "mastery"
        case summoner = "summoner"
        case champion = "champion"
        case profileIcon = "profileicon"
        case map = "map"
        case language = "language"
        case sticker = "sticker"
    }
    
    public init(patch: String, item: String, rune: String, mastery: String, summoner: String, champion: String, profileIcon: String, map: String, language: String, sticker: String) {
        self.patch = patch
        self.item = item
        self.rune = rune
        self.mastery = mastery
        self.summoner = summoner
        self.champion = champion
        self.profileIcon = profileIcon
        self.map = map
        self.language = language
        self.sticker = sticker
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.patch = try container.decode(String.self, forKey: .patch)
        let versions = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .entry)
        self.item = try versions.decode(String.self, forKey: .item)
        self.rune = try versions.decode(String.self, forKey: .rune)
        self.mastery = try versions.decode(String.self, forKey: .mastery)
        self.summoner = try versions.decode(String.self, forKey: .summoner)
        self.champion = try versions.decode(String.self, forKey: .champion)
        self.profileIcon = try versions.decode(String.self, forKey: .profileIcon)
        self.map = try versions.decode(String.self, forKey: .map)
        self.language = try versions.decode(String.self, forKey: .language)
        self.sticker = try versions.decode(String.self, forKey: .sticker)
    }
}
