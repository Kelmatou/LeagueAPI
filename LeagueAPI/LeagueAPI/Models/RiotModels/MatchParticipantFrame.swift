//
//  MatchParticipantFrame.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchParticipantFrame: Decodable {
    
    public var participantId: Int
    public var teamScore: Int?
    public var level: Int
    public var xp: Int
    public var position: MatchPosition?
    public var totalGold: Int
    public var currentGold: Int
    public var minionsKilled: Int
    public var dominionScore: Int?
    public var jungleMinionsKilled: Int
    
    enum CodingKeys: String, CodingKey {
        case participantId = "participantId"
        case teamScore = "teamScore"
        case level = "level"
        case xp = "xp"
        case position = "position"
        case totalGold = "totalGold"
        case currentGold = "currentGold"
        case minionsKilled = "minionsKilled"
        case dominionScore = "dominionScore"
        case jungleMinionsKilled = "jungleMinionsKilled"
    }
    
    public init(participantId: Int, teamScore: Int?, level: Int, xp: Int, position: MatchPosition?, totalGold: Int, currentGold: Int, minionsKilled: Int, dominionScore: Int?, jungleMinionsKilled: Int) {
        self.participantId = participantId
        self.teamScore = teamScore
        self.level = level
        self.xp = xp
        self.position = position
        self.totalGold = totalGold
        self.currentGold = currentGold
        self.minionsKilled = minionsKilled
        self.dominionScore = dominionScore
        self.jungleMinionsKilled = jungleMinionsKilled
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.participantId = try container.decode(Int.self, forKey: .participantId)
        self.teamScore = try? container.decode(Int.self, forKey: .teamScore)
        self.level = try container.decode(Int.self, forKey: .level)
        self.xp = try container.decode(Int.self, forKey: .xp)
        self.position = try? container.decode(MatchPosition.self, forKey: .position)
        self.totalGold = try container.decode(Int.self, forKey: .totalGold)
        self.currentGold = try container.decode(Int.self, forKey: .currentGold)
        self.minionsKilled = try container.decode(Int.self, forKey: .minionsKilled)
        self.dominionScore = try? container.decode(Int.self, forKey: .dominionScore)
        self.jungleMinionsKilled = try container.decode(Int.self, forKey: .jungleMinionsKilled)
    }
}
