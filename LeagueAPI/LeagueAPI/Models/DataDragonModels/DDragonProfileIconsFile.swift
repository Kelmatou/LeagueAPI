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
    public var profileIcons: [ProfileIcon]
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case profileIcons = "data"
    }
    
    public init(version: String, profileIcons: [ProfileIcon]) {
        self.version = version
        self.profileIcons = profileIcons
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let version = try container.decode(String.self, forKey: .version)
        self.version = version
        let profileIconDatas: [String : ProfileIconData] = try container.decode([String : ProfileIconData].self, forKey: .profileIcons)
        self.profileIcons = profileIconDatas.map { ProfileIcon(data: $0.value, version: version) }
    }
}
