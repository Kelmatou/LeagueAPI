//
//  QueueMode.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/18/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class QueueMode {
    
    public enum QueueModes: Long {
        case Custom = 0
        case SnowdownShowdown1V1 = 72
        case SnowdownShowdown2V2 = 73
        case HexakillSummonersRift = 75
        case UltraRapidFire = 76
        case OneForAllMirror = 78
        case CoopvsAIUltraRapidFire = 83
        case HexakillTwistedTreeline = 98
        case AramButcherBridge = 100
        case Nemesis = 310
        case BlackMarketBrawlers = 313
        case DefinitelyNotDominion = 317
        case AllRandomSummonersRift = 325
        case DraftPick5v5 = 400
        case RankedSolo5v5 = 420
        case BlindPick5v5 = 430
        case RankedFlex5v5 = 440
        case Aram = 450
        case BlindPick3v3 = 460
        case RankedFlex3v3 = 470
        case BloodHuntAssassin = 600
        case DarkStarSingularity = 610
        case Clash = 700
        case CoopvsAIIntermediateBotTwistedTreeline = 800
        case CoopvsAIIntroBotTwistedTreeline = 810
        case CoopvsAIBeginnerBotTwistedTreeline = 820
        case CoopvsAIIntroBotSummonersRift = 830
        case CoopvsAIBeginnerBotSummonersRift = 840
        case CoopvsAIIntermediateBotSummonersRift = 850
        case Arurf = 900
        case Ascension = 910
        case LegendOfThePoroKing = 920
        case NexusSiege = 940
        case DoomBotsVoting = 950
        case DoomBotsStandard = 960
        case StarGuardianInvasionNormal = 980
        case StarGuardianInvasionOnslaught = 990
        case ProjectHunters = 1000
        case SnowArurf = 1010
        case OneforAll = 1020
        case NexusBlitz = 1200
        case Unknown = -1
    }
    
    public private(set) var mode: QueueModes
    public private(set) var place: Place
    
    public convenience init?(_ mode: QueueModes) {
        guard mode != .Unknown else {
            Logger.error("Queue mode instance cannot be created with \"Unknown\" value")
            return nil
        }
        self.init(mode.rawValue)
    }
    
    internal init(mode: QueueModes, place: Place) {
        self.mode = mode
        self.place = place
    }
    
    internal convenience init(_ id: Long) {
        switch id {
        case QueueModes.Custom.rawValue:
            self.init(mode: .Custom, place: .Unknown)
        case QueueModes.SnowdownShowdown1V1.rawValue:
            self.init(mode: .SnowdownShowdown1V1, place: .HowlingAbyss)
        case QueueModes.SnowdownShowdown2V2.rawValue:
            self.init(mode: .SnowdownShowdown2V2, place: .HowlingAbyss)
        case QueueModes.HexakillSummonersRift.rawValue:
            self.init(mode: .HexakillSummonersRift, place: .SummonersRift)
        case QueueModes.UltraRapidFire.rawValue:
            self.init(mode: .UltraRapidFire, place: .SummonersRift)
        case QueueModes.OneForAllMirror.rawValue:
            self.init(mode: .OneForAllMirror, place: .HowlingAbyss)
        case QueueModes.CoopvsAIUltraRapidFire.rawValue:
            self.init(mode: .CoopvsAIUltraRapidFire, place: .SummonersRift)
        case QueueModes.HexakillTwistedTreeline.rawValue:
            self.init(mode: .HexakillTwistedTreeline, place: .TwistedTreeline)
        case QueueModes.AramButcherBridge.rawValue:
            self.init(mode: .AramButcherBridge, place: .ButchersBridge)
        case QueueModes.Nemesis.rawValue:
            self.init(mode: .Nemesis, place: .SummonersRift)
        case QueueModes.BlackMarketBrawlers.rawValue:
            self.init(mode: .BlackMarketBrawlers, place: .SummonersRift)
        case QueueModes.DefinitelyNotDominion.rawValue:
            self.init(mode: .DefinitelyNotDominion, place: .CrystalScar)
        case QueueModes.AllRandomSummonersRift.rawValue:
            self.init(mode: .AllRandomSummonersRift, place: .SummonersRift)
        case QueueModes.DraftPick5v5.rawValue:
            self.init(mode: .DraftPick5v5, place: .SummonersRift)
        case QueueModes.RankedSolo5v5.rawValue:
            self.init(mode: .RankedSolo5v5, place: .SummonersRift)
        case QueueModes.BlindPick5v5.rawValue:
            self.init(mode: .BlindPick5v5, place: .SummonersRift)
        case QueueModes.RankedFlex5v5.rawValue:
            self.init(mode: .RankedFlex5v5, place: .SummonersRift)
        case QueueModes.Aram.rawValue:
            self.init(mode: .Aram, place: .HowlingAbyss)
        case QueueModes.BlindPick3v3.rawValue:
            self.init(mode: .BlindPick3v3, place: .TwistedTreeline)
        case QueueModes.RankedFlex3v3.rawValue:
            self.init(mode: .RankedFlex3v3, place: .TwistedTreeline)
        case QueueModes.BloodHuntAssassin.rawValue:
            self.init(mode: .BloodHuntAssassin, place: .SummonersRift)
        case QueueModes.DarkStarSingularity.rawValue:
            self.init(mode: .DarkStarSingularity, place: .CosmicRuins)
        case QueueModes.Clash.rawValue:
            self.init(mode: .Clash, place: .SummonersRift)
        case QueueModes.CoopvsAIIntermediateBotTwistedTreeline.rawValue:
            self.init(mode: .CoopvsAIIntermediateBotTwistedTreeline, place: .TwistedTreeline)
        case QueueModes.CoopvsAIIntroBotTwistedTreeline.rawValue:
            self.init(mode: .CoopvsAIIntroBotTwistedTreeline, place: .TwistedTreeline)
        case QueueModes.CoopvsAIBeginnerBotTwistedTreeline.rawValue:
            self.init(mode: .CoopvsAIBeginnerBotTwistedTreeline, place: .TwistedTreeline)
        case QueueModes.CoopvsAIIntroBotSummonersRift.rawValue:
            self.init(mode: .CoopvsAIIntroBotSummonersRift, place: .SummonersRift)
        case QueueModes.CoopvsAIBeginnerBotSummonersRift.rawValue:
            self.init(mode: .CoopvsAIBeginnerBotSummonersRift, place: .SummonersRift)
        case QueueModes.CoopvsAIIntermediateBotSummonersRift.rawValue:
            self.init(mode: .CoopvsAIIntermediateBotSummonersRift, place: .SummonersRift)
        case QueueModes.Arurf.rawValue:
            self.init(mode: .Arurf, place: .SummonersRift)
        case QueueModes.Ascension.rawValue:
            self.init(mode: .Ascension, place: .CrystalScar)
        case QueueModes.LegendOfThePoroKing.rawValue:
            self.init(mode: .LegendOfThePoroKing, place: .HowlingAbyss)
        case QueueModes.NexusSiege.rawValue:
            self.init(mode: .NexusSiege, place: .SummonersRift)
        case QueueModes.DoomBotsVoting.rawValue:
            self.init(mode: .DoomBotsVoting, place: .SummonersRift)
        case QueueModes.DoomBotsStandard.rawValue:
            self.init(mode: .DoomBotsStandard, place: .SummonersRift)
        case QueueModes.StarGuardianInvasionNormal.rawValue:
            self.init(mode: .StarGuardianInvasionNormal, place: .ValoranCityPark)
        case QueueModes.StarGuardianInvasionOnslaught.rawValue:
            self.init(mode: .StarGuardianInvasionOnslaught, place: .ValoranCityPark)
        case QueueModes.ProjectHunters.rawValue:
            self.init(mode: .ProjectHunters, place: .Substructure43)
        case QueueModes.SnowArurf.rawValue:
            self.init(mode: .SnowArurf, place: .SummonersRift)
        case QueueModes.OneforAll.rawValue:
            self.init(mode: .OneforAll, place: .SummonersRift)
        case QueueModes.NexusBlitz.rawValue:
            self.init(mode: .NexusBlitz, place: .NexusBlitz)
        default:
            Logger.warning("Queue mode id \"\(id)\" unknown (check for LeagueAPI update)")
            self.init(mode: .Unknown, place: .Unknown)
        }
    }
}
