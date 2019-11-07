//
//  TFTMatchInfo.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTMatchInfo: Decodable {
    
    public var gameDate: Datetime
    public var participants: [TFTParticipant]
    public var TFTSetNumber: Int
    public var gameLength: Float
    public var queueId: QueueMode
    public var gameVersion: String
    
    enum CodingKeys: String, CodingKey {
        case gameDate = "game_datetime"
        case participants = "participants"
        case TFTSetNumber = "tft_set_number"
        case gameLength = "game_length"
        case queueId = "queue_id"
        case gameVersion = "game_version"
    }
    
    public init(gameDate: Datetime, participants: [TFTParticipant], TFTSetNumber: Int, gameLength: Float, queueId: QueueMode, gameVersion: String) {
        self.gameDate = gameDate
        self.participants = participants
        self.TFTSetNumber = TFTSetNumber
        self.gameLength = gameLength
        self.queueId = queueId
        self.gameVersion = gameVersion
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let gameDateLong: Long = try container.decode(Long.self, forKey: .gameDate)
        self.gameDate = Datetime(timestamp: gameDateLong)
        self.participants = try container.decode([TFTParticipant].self, forKey: .participants)
        self.TFTSetNumber = try container.decode(Int.self, forKey: .TFTSetNumber)
        self.gameLength = try container.decode(Float.self, forKey: .gameLength)
        self.queueId = try QueueMode(container.decode(Long.self, forKey: .queueId))
        self.gameVersion = try container.decode(String.self, forKey: .gameVersion)
    }
}
