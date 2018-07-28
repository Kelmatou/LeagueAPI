//
//  MatchTimeline.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchTimeline: Decodable {
    
    public var frameInterval: Double
    public var frames: [MatchFrame]
    
    enum CodingKeys: String, CodingKey {
        case frameInterval = "frameInterval"
        case frames = "frames"
    }
    
    public init(frameInterval: Double, frames: [MatchFrame]) {
        self.frameInterval = frameInterval
        self.frames = frames
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frameInterval = try container.decode(Double.self, forKey: .frameInterval)
        self.frames = try container.decode([MatchFrame].self, forKey: .frames)
    }
}
