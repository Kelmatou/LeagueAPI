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
    public private(set) var place: Place
    public private(set) var note: String
    public var id: Long {
        return self.map.rawValue
    }
    public var name: String {
        return self.place.rawValue
    }
    
    public enum Maps: Long {
        case SummerSummonersRift = 1
        case AutumnSummonersRift = 2
        case TutorialMap = 3
        case OriginalTwistedTreeline = 4
        case Dominion = 8
        case TwistedTreeline = 10
        case SummonersRift = 11
        case AramHowlingAbyss = 12
        case AramButchersBridge = 14
        case DarkStarMap = 16
        case StarGuardianMap = 18
        case ProjectMap = 19
        case OdysseyMap = 20
        case NexusBlitzMap = 21
        case Convergence = 22 // unverified
        case Unknown = -1
    }
    
    public convenience init?(map: Maps) {
        guard map != .Unknown else {
            Logger.error("Map instance cannot be created with \"Unknown\" value")
            return nil
        }
        self.init(map.rawValue)
    }
    
    private init(map: Maps, place: Place, note: String) {
        self.map = map
        self.place = place
        self.note = note
    }
    
    internal convenience init(_ id: Long) {
        switch id {
        case Maps.SummerSummonersRift.rawValue:
            self.init(map: .SummerSummonersRift, place: .SummonersRift, note: "Original Summer variant")
        case Maps.AutumnSummonersRift.rawValue:
            self.init(map: .AutumnSummonersRift, place: .SummonersRift, note: "Original Autumn variant")
        case Maps.TutorialMap.rawValue:
            self.init(map: .TutorialMap, place: .ProvingGrounds, note: "Tutorial map")
        case Maps.OriginalTwistedTreeline.rawValue:
            self.init(map: .OriginalTwistedTreeline, place: .TwistedTreeline, note: "Original version")
        case Maps.Dominion.rawValue:
            self.init(map: .Dominion, place: .CrystalScar, note: "Dominion map")
        case Maps.TwistedTreeline.rawValue:
            self.init(map: .TwistedTreeline, place: .TwistedTreeline, note: "Current version")
        case Maps.SummonersRift.rawValue:
            self.init(map: .SummonersRift, place: .SummonersRift, note: "Current version")
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
        case Maps.OdysseyMap.rawValue:
            self.init(map: .OdysseyMap, place: .CrashSite, note: "Odyssey map")
        case Maps.NexusBlitzMap.rawValue:
            self.init(map: .NexusBlitzMap, place: .NexusBlitz, note: "Nexus Blitz map")
        default:
            Logger.warning("Map id \"\(id)\" unknown (check for LeagueAPI update)")
            self.init(map: .Unknown, place: .Unknown, note: "Unknown map with id=\(id)")
        }
    }
}
