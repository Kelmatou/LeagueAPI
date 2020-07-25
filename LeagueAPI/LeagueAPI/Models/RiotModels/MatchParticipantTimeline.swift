//
//  MatchParticipantTimeline.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchParticipantTimeline: Decodable {
    
    public var participantId: Int
    public var lane: String
    public var role: String
    public var goldPerMinDeltas: [String : Double]?
    public var csDiffPerMinDeltas: [String : Double]?
    public var csPerMinDeltas: [String : Double]?
    public var xpDiffPerMinDeltas: [String : Double]?
    public var xpPerMinDeltas: [String : Double]?
    public var damageTakenDiffPerMinDeltas: [String : Double]?
    public var damageTakenPerMinDeltas: [String : Double]?
    
    enum CodingKeys: String, CodingKey {
        case participantId = "participantId"
        case lane = "lane"
        case role = "role"
        case goldPerMinDeltas = "goldPerMinDeltas"
        case csDiffPerMinDeltas = "csDiffPerMinDeltas"
        case csPerMinDeltas = "creepsPerMinDeltas"
        case xpDiffPerMinDeltas = "xpDiffPerMinDeltas"
        case xpPerMinDeltas = "xpPerMinDeltas"
        case damageTakenDiffPerMinDeltas = "damageTakenDiffPerMinDeltas"
        case damageTakenPerMinDeltas = "damageTakenPerMinDeltas"
    }
    
    public init(participantId: Int, lane: String, role: String, goldPerMinDeltas: [String : Double]?, csDiffPerMinDeltas: [String : Double]?, csPerMinDeltas: [String : Double]?, xpDiffPerMinDeltas: [String : Double]?, xpPerMinDeltas: [String : Double]?, damageTakenDiffPerMinDeltas: [String : Double]?, damageTakenPerMinDeltas: [String : Double]?) {
        self.participantId = participantId
        self.lane = lane
        self.role = role
        self.goldPerMinDeltas = goldPerMinDeltas
        self.csDiffPerMinDeltas = csDiffPerMinDeltas
        self.csPerMinDeltas = csPerMinDeltas
        self.xpDiffPerMinDeltas = xpDiffPerMinDeltas
        self.xpPerMinDeltas = xpPerMinDeltas
        self.damageTakenDiffPerMinDeltas = damageTakenDiffPerMinDeltas
        self.damageTakenPerMinDeltas = damageTakenPerMinDeltas
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.participantId = try container.decode(Int.self, forKey: .participantId)
        self.lane = try container.decode(String.self, forKey: .lane)
        self.role = try container.decode(String.self, forKey: .role)
        self.goldPerMinDeltas = try? container.decode([String : Double].self, forKey: .goldPerMinDeltas)
        self.csDiffPerMinDeltas = try? container.decode([String : Double].self, forKey: .csDiffPerMinDeltas)
        self.csPerMinDeltas = try? container.decode([String : Double].self, forKey: .csPerMinDeltas)
        self.xpDiffPerMinDeltas = try? container.decode([String : Double].self, forKey: .xpDiffPerMinDeltas)
        self.xpPerMinDeltas = try? container.decode([String : Double].self, forKey: .xpPerMinDeltas)
        self.damageTakenDiffPerMinDeltas = try? container.decode([String : Double].self, forKey: .damageTakenDiffPerMinDeltas)
        self.damageTakenPerMinDeltas = try? container.decode([String : Double].self, forKey: .damageTakenPerMinDeltas)
    }
}
