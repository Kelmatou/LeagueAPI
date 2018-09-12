//
//  TeamStats.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TeamStats: Decodable {
    
    public var teamId: Int
    public var win: Bool
    public var bans: [TeamBan]
    public var firstDragon: Bool
    public var firstRiftHerald: Bool?
    public var firstBaron: Bool
    public var firstBlood: Bool
    public var firstInhibitor: Bool
    public var firstTower: Bool
    public var baronKills: Int
    public var dragonKills: Int
    public var riftHeraldKills: Int?
    public var vilemawKills: Int
    public var inhibitorKills: Int
    public var towerKills: Int
    public var dominionVictoryScore: Int
    
    enum CodingKeys: String, CodingKey {
        case teamId = "teamId"
        case win = "win"
        case bans = "bans"
        case firstDragon = "firstDragon"
        case firstRiftHerald = "firstRiftHerald"
        case firstBaron = "firstBaron"
        case firstBlood = "firstBlood"
        case firstInhibitor = "firstInhibitor"
        case firstTower = "firstTower"
        case baronKills = "baronKills"
        case dragonKills = "dragonKills"
        case riftHeraldKills = "riftHeraldKills"
        case vilemawKills = "vilemawKills"
        case inhibitorKills = "inhibitorKills"
        case towerKills = "towerKills"
        case dominionVictoryScore = "dominionVictoryScore"
    }
    
    public init(teamId: Int, win: Bool, bans: [TeamBan], firstDragon: Bool, firstRiftHerald: Bool?, firstBaron: Bool, firstBlood: Bool, firstInhibitor: Bool, firstTower: Bool, baronKills: Int, dragonKills: Int, riftHeraldKills: Int?, vilemawKills: Int, inhibitorKills: Int, towerKills: Int, dominionVictoryScore: Int) {
        self.teamId = teamId
        self.win = win
        self.bans = bans
        self.firstDragon = firstDragon
        self.firstRiftHerald = firstRiftHerald
        self.firstBaron = firstBaron
        self.firstBlood = firstBlood
        self.firstInhibitor = firstInhibitor
        self.firstTower = firstTower
        self.baronKills = baronKills
        self.dragonKills = dragonKills
        self.riftHeraldKills = riftHeraldKills
        self.vilemawKills = vilemawKills
        self.inhibitorKills = inhibitorKills
        self.towerKills = towerKills
        self.dominionVictoryScore = dominionVictoryScore
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.teamId = try container.decode(Int.self, forKey: .teamId)
        let winValue: String = (try? container.decode(String.self, forKey: .win)) ?? "Fail" // Bot team does not have a win property so we assume they lost in this case
        self.win = winValue == "Win"
        self.bans = try container.decode([TeamBan].self, forKey: .bans)
        self.firstDragon = try container.decode(Bool.self, forKey: .firstDragon)
        self.firstRiftHerald = try? container.decode(Bool.self, forKey: .firstRiftHerald)
        self.firstBaron = try container.decode(Bool.self, forKey: .firstBaron)
        self.firstBlood = try container.decode(Bool.self, forKey: .firstBlood)
        self.firstInhibitor = try container.decode(Bool.self, forKey: .firstInhibitor)
        self.firstTower = try container.decode(Bool.self, forKey: .firstTower)
        self.baronKills = try container.decode(Int.self, forKey: .baronKills)
        self.dragonKills = try container.decode(Int.self, forKey: .dragonKills)
        self.riftHeraldKills = try? container.decode(Int.self, forKey: .riftHeraldKills)
        self.vilemawKills = try container.decode(Int.self, forKey: .vilemawKills)
        self.inhibitorKills = try container.decode(Int.self, forKey: .inhibitorKills)
        self.towerKills = try container.decode(Int.self, forKey: .towerKills)
        self.dominionVictoryScore = try container.decode(Int.self, forKey: .dominionVictoryScore)
    }
}
