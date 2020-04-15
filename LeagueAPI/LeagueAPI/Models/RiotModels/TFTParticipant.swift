//
//  TFTParticipant.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTParticipant: Decodable {
    
    public var placement: Int
    public var level: Int
    public var lastRound: TFTStage
    public var timeEliminated: Float
    public var companion: TFTCompanion
    public var traits: [TFTTrait]
    public var playersEliminated: Int
    public var puuid: SummonerPuuid
    public var totalDamageToPlayers: Int
    public var units: [TFTUnit]
    public var goldLeft: Int
    
    enum CodingKeys: String, CodingKey {
        case placement = "placement"
        case level = "level"
        case lastRound = "last_round"
        case timeEliminated = "time_eliminated"
        case companion = "companion"
        case traits = "traits"
        case playersEliminated = "players_eliminated" // There is a bug and sometimes, this field will be named "players_eliminated ".
        case playersEliminatedLegacy = "players_eliminated "
        case puuid = "puuid"
        case totalDamageToPlayers = "total_damage_to_players"
        case units = "units"
        case goldLeft = "gold_left"
    }
    
    public init(placement: Int, level: Int, lastRound: TFTStage, timeEliminated: Float, companion: TFTCompanion, traits: [TFTTrait], playersEliminated: Int, puuid: SummonerPuuid, totalDamageToPlayers: Int, units: [TFTUnit], goldLeft: Int) {
        self.placement = placement
        self.level = level
        self.lastRound = lastRound
        self.timeEliminated = timeEliminated
        self.companion = companion
        self.traits = traits
        self.playersEliminated = playersEliminated
        self.puuid = puuid
        self.totalDamageToPlayers = totalDamageToPlayers
        self.units = units
        self.goldLeft = goldLeft
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placement = try container.decode(Int.self, forKey: .placement)
        self.level = try container.decode(Int.self, forKey: .level)
        self.lastRound = try TFTStage(container.decode(Int.self, forKey: .lastRound))
        self.timeEliminated = try container.decode(Float.self, forKey: .timeEliminated)
        self.companion = try container.decode(TFTCompanion.self, forKey: .companion)
        self.traits = try container.decode([TFTTrait].self, forKey: .traits)
        if let playersEliminatedValue = try? container.decode(Int.self, forKey: .playersEliminated) {
            self.playersEliminated = playersEliminatedValue
        } else {
            // We're on the legacy field's name
            self.playersEliminated = try container.decode(Int.self, forKey: .playersEliminatedLegacy)
        }
        self.puuid = try SummonerPuuid(container.decode(String.self, forKey: .puuid))
        self.totalDamageToPlayers = try container.decode(Int.self, forKey: .totalDamageToPlayers)
        self.units = try container.decode([TFTUnit].self, forKey: .units)
        self.goldLeft = try container.decode(Int.self, forKey: .goldLeft)
    }
}
