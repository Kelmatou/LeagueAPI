//
//  Map.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/18/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Map {
    
    public private(set) var map: Maps
    public private(set) var place: Places
    public private(set) var note: String
    public var id: Long {
        return self.map.rawValue
    }
    public var name: String {
        return self.place.rawValue
    }
    
    public enum Maps: Long {
        case SummerSummonerRift = 1
        case AutumnSummonerRift = 2
        case TutorialMap = 3
        case OriginalTwistedTreeline = 4
        case Dominion = 8
        case TwistedTreeline = 10
        case SummonerRift = 11
        case AramHowlingAbyss = 12
        case AramButchersBridge = 14
        case DarkStarMap = 16
        case StarGuardianMap = 18
        case ProjectMap = 19
        case NexusBlitzMap = 21
        case Unknown = -1
    }
    
    public enum Places: String {
        case SummonerRift = "Summoner's Rift"
        case ProvingGrounds = "The Proving Grounds"
        case TwistedTreeline = "Twisted Treeline"
        case CrystalScar = "The Crystal Scar"
        case HowlingAbyss = "Howling Abyss"
        case ButchersBridge = "Butcher's Bridge"
        case CosmicRuins = "Cosmic Ruins"
        case ValoranCityPark = "Valoran City Park"
        case Substructure43 = "Substructure 43"
        case NexusBlitz = "Nexus Blitz"
        case Unknown = "Unknown"
    }
    
    public convenience init?(map: Maps) {
        guard map != .Unknown else {
            Logger.error("Map instance cannot be created with \"Unknown\" value")
            return nil
        }
        self.init(map.rawValue)
    }
    
    private init(map: Maps, place: Places, note: String) {
        self.map = map
        self.place = place
        self.note = note
    }
    
    internal convenience init(_ id: Long) {
        switch id {
        case Maps.SummerSummonerRift.rawValue:
            self.init(map: .SummerSummonerRift, place: .SummonerRift, note: "Original Summer variant")
        case Maps.AutumnSummonerRift.rawValue:
            self.init(map: .AutumnSummonerRift, place: .SummonerRift, note: "Original Autumn variant")
        case Maps.TutorialMap.rawValue:
            self.init(map: .TutorialMap, place: .ProvingGrounds, note: "Tutorial map")
        case Maps.OriginalTwistedTreeline.rawValue:
            self.init(map: .OriginalTwistedTreeline, place: .TwistedTreeline, note: "Original version")
        case Maps.Dominion.rawValue:
            self.init(map: .Dominion, place: .CrystalScar, note: "Dominion map")
        case Maps.TwistedTreeline.rawValue:
            self.init(map: .TwistedTreeline, place: .TwistedTreeline, note: "Current version")
        case Maps.SummonerRift.rawValue:
            self.init(map: .SummonerRift, place: .SummonerRift, note: "Current version")
        case Maps.AramHowlingAbyss.rawValue:
            self.init(map: .AramHowlingAbyss, place: .HowlingAbyss, note: "ARAM map")
        case Maps.AramButchersBridge.rawValue:
            self.init(map: .AramButchersBridge, place: .ButchersBridge, note: "ARAM map")
        case Maps.DarkStarMap.rawValue:
            self.init(map: .DarkStarMap, place: .CosmicRuins, note: "Dark Star: Singularity map")
        case Maps.StarGuardianMap.rawValue:
            self.init(map: .StarGuardianMap, place: .ValoranCityPark, note: "Star Guardian Invasion map")
        case Maps.ProjectMap.rawValue:
            self.init(map: .ProjectMap, place: .Substructure43, note: "PROJECT: Hunters map")
        case Maps.NexusBlitzMap.rawValue:
            self.init(map: .NexusBlitzMap, place: .NexusBlitz, note: "Nexus Blitz map")
        default:
            Logger.warning("Map id \"\(id)\" unknown (check for LeagueAPI update)")
            self.init(map: .Unknown, place: .Unknown, note: "Unknown map with id=\(id)")
        }
    }
}
