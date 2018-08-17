//
//  DDragonProfileIconsFile.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DDragonProfileIconsFile: Decodable {
    
    public var version: String
    public var profileIconIds: [ProfileIconId]
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case profileIcons = "data"
    }
    
    public init(version: String, profileIconIds: [ProfileIconId]) {
        self.version = version
        self.profileIconIds = profileIconIds
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decode(String.self, forKey: .version)
        let profileIcons: [String : ProfileIconData] = try container.decode([String : ProfileIconData].self, forKey: .profileIcons)
        self.profileIconIds = profileIcons.map { return $0.value.id }
    }
}
