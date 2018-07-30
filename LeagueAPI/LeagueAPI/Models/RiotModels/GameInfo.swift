//
//  GameInfo.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class GameInfo: Decodable {
    
    public var gameId: Int64
    public var gameStartTime: Int64
    public var platformId: String
    public var gameMode: GameMode
    public var mapId: Int64
    public var gameType: String
    public var bannedChampions: [BannedChampion]
    public var observer: Observer
    public var participants: [Participant]
    public var gameLength: Int64
    public var gameQueueConfigId: Int64
    
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
    
    public init(gameId: Int64, gameStartTime: Int64, platformId: String, gameMode: GameMode, mapId: Int64, gameType: String, bannedChampions: [BannedChampion], observer: Observer, participants: [Participant], gameLength: Int64, gameQueueConfigId: Int64) {
        self.gameId = gameId
        self.gameStartTime = gameStartTime
        self.platformId = platformId
        self.gameMode = gameMode
        self.mapId = mapId
        self.gameType = gameType
        self.bannedChampions = bannedChampions
        self.observer = observer
        self.participants = participants
        self.gameLength = gameLength
        self.gameQueueConfigId = gameQueueConfigId
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gameId = try container.decode(Int64.self, forKey: .gameId)
        self.gameStartTime = try container.decode(Int64.self, forKey: .gameStartTime)
        self.platformId = try container.decode(String.self, forKey: .platformId)
        self.gameMode = try GameMode(gameMode: container.decode(String.self, forKey: .gameMode))
        self.mapId = try container.decode(Int64.self, forKey: .mapId)
        self.gameType = try container.decode(String.self, forKey: .gameType)
        self.bannedChampions = try container.decode([BannedChampion].self, forKey: .bannedChampions)
        self.observer = try container.decode(Observer.self, forKey: .observer)
        self.participants = try container.decode([Participant].self, forKey: .participants)
        self.gameLength = try container.decode(Int64.self, forKey: .gameLength)
        self.gameQueueConfigId = try container.decode(Int64.self, forKey: .gameQueueConfigId)
    }
}
