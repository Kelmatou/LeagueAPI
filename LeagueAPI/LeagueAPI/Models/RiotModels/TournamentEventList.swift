//
//  TournamentEventList.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class TournamentEventList: Decodable {
    
    public var eventList: [TournamentEvent]
    
    enum CodingKeys: String, CodingKey {
        case eventList = "eventList"
    }
    
    public init(eventList: [TournamentEvent]) {
        self.eventList = eventList
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.eventList = try container.decode([TournamentEvent].self, forKey: .eventList)
    }
}
