//
//  TFTRatedLadder.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/30/21.
//  Copyright © 2021 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTRatedLadder: Decodable {
    
    public var summonerId: SummonerId
    public var summonerName: String
    public var tier: TFTLadderTier
    public var rating: Int
    public var wins: Int
    public var previousLadderPosition: Int
    
    enum CodingKeys: String, CodingKey {
        case summonerId = "summonerId"
        case summonerName = "summonerName"
        case ratedTier = "ratedTier"
        case ratedRating = "ratedRating"
        case wins = "wins"
        case previousUpdateLadderPosition = "previousUpdateLadderPosition"
    }
    
    public init(summonerId: SummonerId, summonerName: String, tier: TFTLadderTier, rating: Int, wins: Int, previousLadderPosition: Int) {
        self.summonerId = summonerId
        self.summonerName = summonerName
        self.tier = tier
        self.rating = rating
        self.wins = wins
        self.previousLadderPosition = previousLadderPosition
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.summonerId = try SummonerId(container.decode(String.self, forKey: .summonerId))
        self.summonerName = try container.decode(String.self, forKey: .summonerName)
        self.tier = try TFTLadderTier(container.decode(String.self, forKey: .ratedTier))
        self.rating = try container.decode(Int.self, forKey: .ratedRating)
        self.wins = try container.decode(Int.self, forKey: .wins)
        self.previousLadderPosition = try container.decode(Int.self, forKey: .previousUpdateLadderPosition)
    }
}
