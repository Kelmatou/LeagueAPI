//
//  GameInfo.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class GameInfo: Decodable {
    
    public var gameId: GameId
    public var gameStartTime: Datetime
    public var platformId: String
    public var gameMode: GameMode
    public var map: Map
    public var gameType: GameType
    public var bannedChampions: [BannedChampion]
    public var observer: Observer
    public var participants: [Participant]
    public var gameLength: Duration
    public var gameQueueConfig: QueueMode
    
    enum CodingKeys: String, CodingKey {
        case gameId = "gameId"
        case gameStartTime = "gameStartTime"
        case platformId = "platformId"
        case gameMode = "gameMode"
        case mapId = "mapId"
        case gameType = "gameType"
        case bannedChampions = "bannedChampions"
        case observer = "observers"
        case participants = "participants"
        case gameLength = "gameLength"
        case gameQueueConfigId = "gameQueueConfigId"
    }
    
    public init(gameId: GameId, gameStartTime: Datetime, platformId: String, gameMode: GameMode, map: Map, gameType: GameType, bannedChampions: [BannedChampion], observer: Observer, participants: [Participant], gameLength: Duration, gameQueueConfig: QueueMode) {
        self.gameId = gameId
        self.gameStartTime = gameStartTime
        self.platformId = platformId
        self.gameMode = gameMode
        self.map = map
        self.gameType = gameType
        self.bannedChampions = bannedChampions
        self.observer = observer
        self.participants = participants
        self.gameLength = gameLength
        self.gameQueueConfig = gameQueueConfig
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gameId = try GameId(container.decode(Long.self, forKey: .gameId))
        let timestamp: Long = try container.decode(Long.self, forKey: .gameStartTime)
        self.gameStartTime = Datetime(timestamp: timestamp)
        self.platformId = try container.decode(String.self, forKey: .platformId)
        self.gameMode = try GameMode(container.decode(String.self, forKey: .gameMode))
        self.map = try Map(container.decode(Long.self, forKey: .mapId))
        self.gameType = try GameType(container.decode(String.self, forKey: .gameType))
        self.bannedChampions = try container.decode([BannedChampion].self, forKey: .bannedChampions)
        self.observer = try container.decode(Observer.self, forKey: .observer)
        self.participants = try container.decode([Participant].self, forKey: .participants)
        let durationSec: Long = try container.decode(Long.self, forKey: .gameLength)
        self.gameLength = Duration(seconds: Double(durationSec))
        self.gameQueueConfig = try QueueMode(container.decode(Long.self, forKey: .gameQueueConfigId))
    }
}
