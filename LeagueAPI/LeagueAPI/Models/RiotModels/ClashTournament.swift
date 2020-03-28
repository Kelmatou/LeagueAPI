//
//  ClashTournament.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class ClashTournament: Decodable {
    
    public var tournamentId: TournamentId
    public var themeId: ThemeId
    public var nameKey: String
    public var nameKeySecondary: String
    public var schedule: [ClashTournamentPhase]
    
    enum CodingKeys: String, CodingKey {
        case tournamentId = "id"
        case themeId = "themeId"
        case nameKey = "nameKey"
        case nameKeySecondary = "nameKeySecondary"
        case schedule = "schedule"
    }
    
    public init(tournamentId: TournamentId, themeId: ThemeId, nameKey: String, nameKeySecondary: String, schedule: [ClashTournamentPhase]) {
        self.tournamentId = tournamentId
        self.themeId = themeId
        self.nameKey = nameKey
        self.nameKeySecondary = nameKeySecondary
        self.schedule = schedule
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tournamentId = try TournamentId(container.decode(Long.self, forKey: .tournamentId))
        self.themeId = try ThemeId(container.decode(Long.self, forKey: .themeId))
        self.nameKey = try container.decode(String.self, forKey: .nameKey)
        self.nameKeySecondary = try container.decode(String.self, forKey: .nameKeySecondary)
        self.schedule = try container.decode([ClashTournamentPhase].self, forKey: .schedule)
    }
}
