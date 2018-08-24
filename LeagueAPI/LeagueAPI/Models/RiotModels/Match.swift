//
//  Match.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Match: Decodable {
    
    public var season: Season
    public var queueMode: QueueMode
    public var gameId: GameId
    public var participants: [MatchParticipantIdentity]
    public var patch: String
    public var platformId: String
    public var gameMode: GameMode
    public var map: Map
    public var gameType: GameType
    public var teamsInfo: [TeamStats]
    public var participantsInfo: [MatchParticipant]
    public var gameDuration: Duration
    public var gameCreation: Datetime
    
    enum CodingKeys: String, CodingKey {
        case seasonId = "seasonId"
        case queueId = "queueId"
        case gameId = "gameId"
        case participants = "participantIdentities"
        case patch = "gameVersion"
        case platformId = "platformId"
        case gameMode = "gameMode"
        case mapId = "mapId"
        case gameType = "gameType"
        case teamsInfo = "teams"
        case participantsInfo = "participants"
        case gameDuration = "gameDuration"
        case gameCreation = "gameCreation"
    }
    
    public init(season: Season, queueMode: QueueMode, gameId: GameId, participants: [MatchParticipantIdentity], patch: String, platformId: String, gameMode: GameMode, map: Map, gameType: GameType, teamsInfo: [TeamStats], participantsInfo: [MatchParticipant], gameDuration: Duration, gameCreation: Datetime) {
        self.season = season
        self.queueMode = queueMode
        self.gameId = gameId
        self.participants = participants
        self.patch = patch
        self.platformId = platformId
        self.gameMode = gameMode
        self.map = map
        self.gameType = gameType
        self.teamsInfo = teamsInfo
        self.participantsInfo = participantsInfo
        self.gameDuration = gameDuration
        self.gameCreation = gameCreation
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.season = try Season(container.decode(Int.self, forKey: .seasonId))
        self.queueMode = try QueueMode(container.decode(Long.self, forKey: .queueId))
        self.gameId = try GameId(container.decode(Long.self, forKey: .gameId))
        self.participants = try container.decode([MatchParticipantIdentity].self, forKey: .participants)
        self.patch = try container.decode(String.self, forKey: .patch)
        self.platformId = try container.decode(String.self, forKey: .platformId)
        self.gameMode = try GameMode(container.decode(String.self, forKey: .gameMode))
        self.map = try Map(container.decode(Long.self, forKey: .mapId))
        self.gameType = try GameType(container.decode(String.self, forKey: .gameType))
        self.teamsInfo = try container.decode([TeamStats].self, forKey: .teamsInfo)
        self.participantsInfo = try container.decode([MatchParticipant].self, forKey: .participantsInfo)
        let gameDurationSec: Long = try container.decode(Long.self, forKey: .gameDuration)
        self.gameDuration = Duration(seconds: Double(gameDurationSec))
        let gameCreationTimestamp: Long = try container.decode(Long.self, forKey: .gameCreation)
        self.gameCreation = Datetime(timestamp: gameCreationTimestamp)
    }
}
