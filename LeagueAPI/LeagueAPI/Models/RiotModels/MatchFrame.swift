//
//  MatchFrame.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchFrame: Decodable {
    
    public var events: [MatchEvent]
    public var participantFrames: [Int : MatchParticipantFrame]
    public var timestamp: Double
    
    enum CodingKeys: String, CodingKey {
        case events = "events"
        case participantFrames = "participantFrames"
        case timestamp = "timestamp"
    }
    
    public init(events: [MatchEvent], participantFrames: [Int: MatchParticipantFrame], timestamp: Double) {
        self.events = events
        self.participantFrames = participantFrames
        self.timestamp = timestamp
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.events = try container.decode([MatchEvent].self, forKey: .events)
        self.participantFrames = try container.decode([Int : MatchParticipantFrame].self, forKey: .participantFrames)
        self.timestamp = try container.decode(Double.self, forKey: .timestamp)
    }
}
