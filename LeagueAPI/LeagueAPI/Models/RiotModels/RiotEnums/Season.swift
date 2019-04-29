//
//  Season.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/18/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Season {
    
    public enum Seasons: Int {
        case Preseason3 = 0
        case Season3 = 1
        case Preseason4 = 2
        case Season4 = 3
        case Preseason5 = 4
        case Season5 = 5
        case Preseason6 = 6
        case Season6 = 7
        case Preseason7 = 8
        case Season7 = 9
        case Preseason8 = 10
        case Season8 = 11
        case Preseason9 = 12
        case Season9 = 13
        case Unknown = -1
    }
    
    public private(set) var season: Seasons
    public private(set) var name: String
    
    public convenience init?(_ season: Seasons) {
        guard season != .Unknown else {
            Logger.error("Cannot create Season object with .Unknown season")
            return nil
        }
        self.init(season.rawValue)
    }
    
    internal init(season: Seasons, name: String) {
        self.season = season
        self.name = name
    }
    
    internal convenience init(_ id: Int) {
        switch id {
        case Seasons.Preseason3.rawValue:
            self.init(season: Seasons.Preseason3, name: "Preseason 3")
        case Seasons.Season3.rawValue:
            self.init(season: Seasons.Season3, name: "Season 3")
        case Seasons.Preseason4.rawValue:
            self.init(season: Seasons.Preseason4, name: "Preseason 4")
        case Seasons.Season4.rawValue:
            self.init(season: Seasons.Season4, name: "Season 4")
        case Seasons.Preseason5.rawValue:
            self.init(season: Seasons.Preseason5, name: "Preseason 5")
        case Seasons.Season5.rawValue:
            self.init(season: Seasons.Season5, name: "Season 5")
        case Seasons.Preseason6.rawValue:
            self.init(season: Seasons.Preseason6, name: "Preseason 6")
        case Seasons.Season6.rawValue:
            self.init(season: Seasons.Season6, name: "Season 6")
        case Seasons.Preseason7.rawValue:
            self.init(season: Seasons.Preseason7, name: "Preseason 7")
        case Seasons.Season7.rawValue:
            self.init(season: Seasons.Season7, name: "Season 7")
        case Seasons.Preseason8.rawValue:
            self.init(season: Seasons.Preseason8, name: "Preseason 8")
        case Seasons.Season8.rawValue:
            self.init(season: Seasons.Season8, name: "Season 8")
        case Seasons.Preseason9.rawValue:
            self.init(season: Seasons.Preseason9, name: "Preseason 9")
        case Seasons.Season9.rawValue:
            self.init(season: Seasons.Season9, name: "Season 9")
        default:
            Logger.warning("Season id \"\(id)\" unknown (check for LeagueAPI update)")
            self.init(season: .Unknown, name: "Unknown season with id=\(id)")
        }
    }
}
