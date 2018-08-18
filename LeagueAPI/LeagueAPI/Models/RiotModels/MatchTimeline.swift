//
//  MatchTimeline.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchTimeline: Decodable {
    
    public var frameInterval: Datetime
    public var frames: [MatchFrame]
    
    enum CodingKeys: String, CodingKey {
        case frameInterval = "frameInterval"
        case frames = "frames"
    }
    
    public init(frameInterval: Datetime, frames: [MatchFrame]) {
        self.frameInterval = frameInterval
        self.frames = frames
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let durationMs: Long = try container.decode(Long.self, forKey: .frameInterval)
        self.frameInterval = Datetime(timestamp: durationMs)
        self.frames = try container.decode([MatchFrame].self, forKey: .frames)
    }
}
