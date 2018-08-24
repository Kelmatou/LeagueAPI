//
//  ProfileIconData.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ProfileIconData: Decodable {
    
    public var id: ProfileIconId
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    
    public init(id: ProfileIconId) {
        self.id = id
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try ProfileIconId(container.decode(Long.self, forKey: .id))
    }
}
