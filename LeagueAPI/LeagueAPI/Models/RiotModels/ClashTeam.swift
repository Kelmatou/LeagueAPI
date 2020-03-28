//
//  ClashTeam.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class ClashTeam: Decodable {
    
    public var teamId: TeamId
    public var tournamentId: TournamentId
    public var name: String
    public var iconId: ProfileIconId
    public var tier: Int
    public var captainId: SummonerId
    public var abbreviation: String
    public var players: [ClashPlayer]
    
    enum CodingKeys: String, CodingKey {
        case teamId = "id"
        case tournamentId = "tournamentId"
        case name = "name"
        case iconId = "iconId"
        case tier = "tier"
        case captainId = "captain"
        case abbreviation = "abbreviation"
        case players = "players"
    }
    
    public init(teamId: TeamId, tournamentId: TournamentId, name: String, iconId: ProfileIconId, tier: Int, captainId: SummonerId, abbreviation: String, players: [ClashPlayer]) {
        self.teamId = teamId
        self.tournamentId = tournamentId
        self.name = name
        self.iconId = iconId
        self.tier = tier
        self.captainId = captainId
        self.abbreviation = abbreviation
        self.players = players
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.teamId = try TeamId(container.decode(String.self, forKey: .teamId))
        self.tournamentId = try TournamentId(container.decode(Long.self, forKey: .tournamentId))
        self.name = try container.decode(String.self, forKey: .name)
        self.iconId = try ProfileIconId(container.decode(Long.self, forKey: .iconId))
        self.tier = try container.decode(Int.self, forKey: .tier)
        self.captainId = try SummonerId(container.decode(String.self, forKey: .captainId))
        self.abbreviation = try container.decode(String.self, forKey: .abbreviation)
        self.players = try container.decode([ClashPlayer].self, forKey: .players)
    }
}
