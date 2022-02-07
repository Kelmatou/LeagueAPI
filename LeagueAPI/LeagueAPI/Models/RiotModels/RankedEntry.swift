//
//  RankedEntry.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 4/28/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class RankedEntry: Decodable {
    
    let leagueID: String?
    let queueType: String
    let tier, rank: String?
    let summonerID, summonerName: String
    let leaguePoints: Int?
    let wins, losses: Int
    let veteran, inactive, freshBlood, hotStreak: Bool?
    let ratedTier: String?
    let ratedRating: Int?

    enum CodingKeys: String, CodingKey {
        case leagueID = "leagueId"
        case queueType, tier, rank
        case summonerID = "summonerId"
        case summonerName, leaguePoints, wins, losses, veteran, inactive, freshBlood, hotStreak, ratedTier, ratedRating
    }
    
    public init(leagueId: LeagueId, leagueName: String, leagueInfo: LeagueInfo, queue: Queue) {
        self.leagueId = leagueId
        self.leagueInfo = leagueInfo
        self.queue = queue
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.leagueId = try LeagueId(container.decode(String.self, forKey: .leagueId))
        self.leagueInfo = try LeagueInfo(from: decoder)
        self.queue = try Queue(container.decode(String.self, forKey: .queue))
    }
}
