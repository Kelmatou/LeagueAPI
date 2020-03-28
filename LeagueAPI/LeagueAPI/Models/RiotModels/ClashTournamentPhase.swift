//
//  ClashTournamentPhase.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class ClashTournamentPhase: Decodable {
    
    public var tournamentId: TournamentId
    public var registrationTime: Datetime
    public var startTime: Datetime
    public var cancelled: Bool
    
    enum CodingKeys: String, CodingKey {
        case tournamentId = "id"
        case registrationTime = "registrationTime"
        case startTime = "startTime"
        case cancelled = "cancelled"
    }
    
    public init(tournamentId: TournamentId, registrationTime: Datetime, startTime: Datetime, cancelled: Bool) {
        self.tournamentId = tournamentId
        self.registrationTime = registrationTime
        self.startTime = startTime
        self.cancelled = cancelled
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tournamentId = try TournamentId(container.decode(Long.self, forKey: .tournamentId))
        self.registrationTime = try Datetime(timestamp: container.decode(Long.self, forKey: .registrationTime))
        self.startTime = try Datetime(timestamp: container.decode(Long.self, forKey: .startTime))
        self.cancelled = try container.decode(Bool.self, forKey: .cancelled)
    }
}
