//
//  ClashPlayer.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class ClashPlayer: Decodable {
    
    public var summonerId: SummonerId
    public var teamId: TeamId?
    public var position: GameRole
    public var teamRole: TeamRole
    
    enum CodingKeys: String, CodingKey {
        case summonerId = "summonerId"
        case teamId = "teamId"
        case position = "position"
        case teamRole = "role"
    }
    
    public init(summonerId: SummonerId, teamId: TeamId?, position: GameRole, teamRole: TeamRole) {
        self.summonerId = summonerId
        self.teamId = teamId
        self.position = position
        self.teamRole = teamRole
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.summonerId = try SummonerId(container.decode(String.self, forKey: .summonerId))
        self.teamId = try? TeamId(container.decode(String.self, forKey: .teamId))
        self.position = try GameRole(container.decode(String.self, forKey: .position))
        self.teamRole = try TeamRole(container.decode(String.self, forKey: .teamRole))
    }
}
