//
//  Match.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Match: Decodable {
    
    public var seasonId: Int
    public var queueId: Int
    public var gameId: Int64
    public var participants: [MatchParticipantIdentity]
    public var patch: String
    public var platformId: String
    public var gameMode: String
    public var mapId: Int
    public var gameType: String
    public var teamsInfo: [TeamStats]
    public var participantsInfo: [MatchParticipant]
    public var gameDuration: Int64
    public var gameCreation: Int64
    
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
    
    public init(seasonId: Int, queueId: Int, gameId: Int64, participants: [MatchParticipantIdentity], patch: String, platformId: String, gameMode: String, mapId: Int, gameType: String, teamsInfo: [TeamStats], participantsInfo: [MatchParticipant], gameDuration: Int64, gameCreation: Int64) {
        self.seasonId = seasonId
        self.queueId = queueId
        self.gameId = gameId
        self.participants = participants
        self.patch = patch
        self.platformId = platformId
        self.gameMode = gameMode
        self.mapId = mapId
        self.gameType = gameType
        self.teamsInfo = teamsInfo
        self.participantsInfo = participantsInfo
        self.gameDuration = gameDuration
        self.gameCreation = gameCreation
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.seasonId = try container.decode(Int.self, forKey: .seasonId)
        self.queueId = try container.decode(Int.self, forKey: .queueId)
        self.gameId = try container.decode(Int64.self, forKey: .gameId)
        self.participants = try container.decode([MatchParticipantIdentity].self, forKey: .participants)
        self.patch = try container.decode(String.self, forKey: .patch)
        self.platformId = try container.decode(String.self, forKey: .platformId)
        self.gameMode = try container.decode(String.self, forKey: .gameMode)
        self.mapId = try container.decode(Int.self, forKey: .mapId)
        self.gameType = try container.decode(String.self, forKey: .gameType)
        self.teamsInfo = try container.decode([TeamStats].self, forKey: .teamsInfo)
        self.participantsInfo = try container.decode([MatchParticipant].self, forKey: .participantsInfo)
        self.gameDuration = try container.decode(Int64.self, forKey: .gameDuration)
        self.gameCreation = try container.decode(Int64.self, forKey: .gameCreation)
    }
}
