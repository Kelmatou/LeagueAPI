//
//  MatchParticipantIdentity.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchParticipantIdentity: Decodable {
    
    public var participantId: Int
    public var player: MatchPlayer
    
    enum CodingKeys: String, CodingKey {
        case participantId = "participantId"
        case player = "player"
    }
    
    public init(participantId: Int, player: MatchPlayer) {
        self.participantId = participantId
        self.player = player
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.participantId = try container.decode(Int.self, forKey: .participantId)
        self.player = try container.decode(MatchPlayer.self, forKey: .player)
    }
}
