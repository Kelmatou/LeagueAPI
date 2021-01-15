//
//  RunneteraMatchPlayer.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 1/15/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraMatchPlayer: Decodable {
    
    public var puuid: SummonerPuuid
    public var deckId: String
    public var deckCode: String
    public var factions: [String]
    public var gameOutcome: String
    public var orderToPlay: Int
    
    enum CodingKeys: String, CodingKey {
        case puuid = "puuid"
        case deckId = "deck_id"
        case deckCode = "deck_code"
        case factions = "factions"
        case gameOutcome = "game_outcome"
        case orderToPlay = "order_of_play"
    }
    
    public init(puuid: SummonerPuuid, deckId: String, deckCode: String, factions: [String], gameOutcome: String, orderToPlay: Int) {
        self.puuid = puuid
        self.deckId = deckId
        self.deckCode = deckCode
        self.factions = factions
        self.gameOutcome = gameOutcome
        self.orderToPlay = orderToPlay
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.puuid = try SummonerPuuid(container.decode(String.self, forKey: .puuid))
        self.deckId = try container.decode(String.self, forKey: .deckId)
        self.deckCode = try container.decode(String.self, forKey: .deckCode)
        self.factions = try container.decode([String].self, forKey: .factions)
        self.gameOutcome = try container.decode(String.self, forKey: .gameOutcome)
        self.orderToPlay = try container.decode(Int.self, forKey: .orderToPlay)
    }
}
