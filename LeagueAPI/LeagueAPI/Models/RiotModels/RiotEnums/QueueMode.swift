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
        case OldBlindPick5v5 = 2 // Deprecated in patch 7.19 in favor of Queue Mode 430
        case OldRankedSolo5v5 = 4 // Deprecated in favor of Queue Mode 420
        case OldRankedPremade5v5 = 6 // Queue mode deprecated
        case OldCoopvsAI = 7 // Deprecated in favor of Queue Mode 32 and 33
        case OldBlindPick3v3 = 8 // Deprecated in patch 7.19 in favor of Queue Mode 460
        case OldRankedFlex3v3 = 9 // Deprecated in patch 7.19 in favor of Queue Mode 470
        case OldDraftPick5v5 = 14 // Deprecated in favor of Queue Mode 400
        case OldDominionBlindPick = 16 // Queue mode deprecated
        case OldDominionDraftPick = 17 // Queue mode deprecated
        case OldDominionCoopvsAI = 25 // Queue mode deprecated
        case OldCoopvsAIIntroBotSummonersRift = 31 // Deprecated in patch 7.19 in favor of Queue Mode 830
        case OldCoopvsAIBeginnerBotSummonersRift = 32 // Deprecated in patch 7.19 in favor of Queue Mode 840
        case OldCoopvsAIIntermediateBotSummonersRift = 33 // Deprecated in patch 7.19 in favor of Queue Mode 850
        case OldRankedTeam3v3 = 41 // Queue mode deprecated
        case OldRankedTeam5v5 = 42 // Queue mode deprecated
        case OldCoopvsAIIntermediateBotTwistedTreeline = 52 // Deprecated in patch 7.19 in favor of Queue Mode 800
        case OldTeamBuilder5v5 = 61 // Queue mode deprecated
        case OldAram = 65 // Deprecated in patch 7.19 in favor of Queue Mode 450
        case OldOneforAll = 70 // Deprecated in patch 8.6 in favor of Queue Mode 1020
        case SnowdownShowdown1V1 = 72
        case SnowdownShowdown2V2 = 73
        case HexakillSummonersRift = 75
        case UltraRapidFire = 76
        case OneForAllMirror = 78
        case CoopvsAIUltraRapidFire = 83
        case OldDoomBotsRank1 = 91 // Deprecated in patch 7.19 in favor of Queue Mode 950
        case OldDoomBotsRank2 = 92 // Deprecated in patch 7.19 in favor of Queue Mode 950
        case OldDoomBotsRank5 = 93 // Deprecated in patch 7.19 in favor of Queue Mode 950
        case OldAscension = 96 // Deprecated in patch 7.19 in favor of Queue Mode 910
        case HexakillTwistedTreeline = 98
        case AramButcherBridge = 100
        case OldLegendOfThePoroKing = 300 // Deprecated in patch 7.19 in favor of Queue Mode 920
        case Nemesis = 310
        case BlackMarketBrawlers = 313
        case OldNexusSiege = 315 // Deprecated in patch 7.19 in favor of Queue Mode 940
        case DefinitelyNotDominion = 317
        case OldArurf = 318 // Deprecated in patch 7.19 in favor of Queue Mode 900
        case AllRandomSummonersRift = 325
        case DraftPick5v5 = 400
        case OldRankedDynamic5v5 = 410 // Queue mode deprecated in patch 6.22
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
        case OdysseyIntro = 1030
        case OdysseyCadet = 1040
        case OdysseyCrewMember = 1050
        case OdysseyCaptain = 1060
        case OdysseyOnslaught = 1070
        case TeamFightTactics = 1090
        case RankedTeamFightTactics = 1100
        case TutorialTeamFightTactics = 1110
        case NexusBlitzFirstEdition = 1200 // Queue mode deprecated in patch 9.2
        case NexusBlitz = 1300
        case Tutorial1 = 2000
        case Tutorial2 = 2010
        case Tutorial3 = 2020
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
        case QueueModes.OldBlindPick5v5.rawValue:
            self.init(mode: .OldBlindPick5v5, place: .SummonersRift)
        case QueueModes.OldRankedSolo5v5.rawValue:
            self.init(mode: .OldRankedSolo5v5, place: .SummonersRift)
        case QueueModes.OldRankedPremade5v5.rawValue:
            self.init(mode: .OldRankedPremade5v5, place: .SummonersRift)
        case QueueModes.OldCoopvsAI.rawValue:
            self.init(mode: .OldCoopvsAI, place: .SummonersRift)
        case QueueModes.OldBlindPick3v3.rawValue:
            self.init(mode: .OldBlindPick3v3, place: .TwistedTreeline)
        case QueueModes.OldRankedFlex3v3.rawValue:
            self.init(mode: .OldRankedFlex3v3, place: .TwistedTreeline)
        case QueueModes.OldDraftPick5v5.rawValue:
            self.init(mode: .OldDraftPick5v5, place: .SummonersRift)
        case QueueModes.OldDominionBlindPick.rawValue:
            self.init(mode: .OldDominionBlindPick, place: .CrystalScar)
        case QueueModes.OldDominionDraftPick.rawValue:
            self.init(mode: .OldDominionDraftPick, place: .CrystalScar)
        case QueueModes.OldDominionCoopvsAI.rawValue:
            self.init(mode: .OldDominionCoopvsAI, place: .CrystalScar)
        case QueueModes.OldCoopvsAIIntroBotSummonersRift.rawValue:
            self.init(mode: .OldCoopvsAIIntroBotSummonersRift, place: .SummonersRift)
        case QueueModes.OldCoopvsAIBeginnerBotSummonersRift.rawValue:
            self.init(mode: .OldCoopvsAIBeginnerBotSummonersRift, place: .SummonersRift)
        case QueueModes.OldCoopvsAIIntermediateBotSummonersRift.rawValue:
            self.init(mode: .OldCoopvsAIIntermediateBotSummonersRift, place: .SummonersRift)
        case QueueModes.OldRankedTeam3v3.rawValue:
            self.init(mode: .OldRankedTeam3v3, place: .TwistedTreeline)
        case QueueModes.OldRankedTeam5v5.rawValue:
            self.init(mode: .OldRankedTeam5v5, place: .SummonersRift)
        case QueueModes.OldCoopvsAIIntermediateBotTwistedTreeline.rawValue:
            self.init(mode: .OldCoopvsAIIntermediateBotTwistedTreeline, place: .TwistedTreeline)
        case QueueModes.OldTeamBuilder5v5.rawValue:
            self.init(mode: .OldTeamBuilder5v5, place: .SummonersRift)
        case QueueModes.OldAram.rawValue:
            self.init(mode: .OldAram, place: .HowlingAbyss)
        case QueueModes.OldOneforAll.rawValue:
            self.init(mode: .OldOneforAll, place: .SummonersRift)
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
        case QueueModes.OldDoomBotsRank1.rawValue:
            self.init(mode: .OldDoomBotsRank1, place: .SummonersRift)
        case QueueModes.OldDoomBotsRank2.rawValue:
            self.init(mode: .OldDoomBotsRank2, place: .SummonersRift)
        case QueueModes.OldDoomBotsRank5.rawValue:
            self.init(mode: .OldDoomBotsRank5, place: .SummonersRift)
        case QueueModes.OldAscension.rawValue:
            self.init(mode: .OldAscension, place: .CrystalScar)
        case QueueModes.HexakillTwistedTreeline.rawValue:
            self.init(mode: .HexakillTwistedTreeline, place: .TwistedTreeline)
        case QueueModes.AramButcherBridge.rawValue:
            self.init(mode: .AramButcherBridge, place: .ButchersBridge)
        case QueueModes.OldLegendOfThePoroKing.rawValue:
            self.init(mode: .OldLegendOfThePoroKing, place: .HowlingAbyss)
        case QueueModes.Nemesis.rawValue:
            self.init(mode: .Nemesis, place: .SummonersRift)
        case QueueModes.BlackMarketBrawlers.rawValue:
            self.init(mode: .BlackMarketBrawlers, place: .SummonersRift)
        case QueueModes.OldNexusSiege.rawValue:
            self.init(mode: .OldNexusSiege, place: .SummonersRift)
        case QueueModes.DefinitelyNotDominion.rawValue:
            self.init(mode: .DefinitelyNotDominion, place: .CrystalScar)
        case QueueModes.OldArurf.rawValue:
            self.init(mode: .OldArurf, place: .SummonersRift)
        case QueueModes.AllRandomSummonersRift.rawValue:
            self.init(mode: .AllRandomSummonersRift, place: .SummonersRift)
        case QueueModes.DraftPick5v5.rawValue:
            self.init(mode: .DraftPick5v5, place: .SummonersRift)
        case QueueModes.OldRankedDynamic5v5.rawValue:
            self.init(mode: .OldRankedDynamic5v5, place: .SummonersRift)
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
        case QueueModes.OdysseyIntro.rawValue:
            self.init(mode: .OdysseyIntro, place: .CrashSite)
        case QueueModes.OdysseyCadet.rawValue:
            self.init(mode: .OdysseyCadet, place: .CrashSite)
        case QueueModes.OdysseyCrewMember.rawValue:
            self.init(mode: .OdysseyCrewMember, place: .CrashSite)
        case QueueModes.OdysseyCaptain.rawValue:
            self.init(mode: .OdysseyCaptain, place: .CrashSite)
        case QueueModes.OdysseyOnslaught.rawValue:
            self.init(mode: .OdysseyOnslaught, place: .CrashSite)
        case QueueModes.TeamFightTactics.rawValue:
            self.init(mode: .TeamFightTactics, place: .Convergence)
        case QueueModes.RankedTeamFightTactics.rawValue:
            self.init(mode: .RankedTeamFightTactics, place: .Convergence)
        case QueueModes.TutorialTeamFightTactics.rawValue:
            self.init(mode: .TutorialTeamFightTactics, place: .Convergence)
        case QueueModes.NexusBlitzFirstEdition.rawValue:
            self.init(mode: .NexusBlitzFirstEdition, place: .NexusBlitz)
        case QueueModes.NexusBlitz.rawValue:
            self.init(mode: .NexusBlitz, place: .NexusBlitz)
        case QueueModes.Tutorial1.rawValue:
            self.init(mode: .Tutorial1, place: .SummonersRift)
        case QueueModes.Tutorial2.rawValue:
            self.init(mode: .Tutorial2, place: .SummonersRift)
        case QueueModes.Tutorial3.rawValue:
            self.init(mode: .Tutorial3, place: .SummonersRift)
        default:
            Logger.warning("Queue mode id \"\(id)\" unknown (check for LeagueAPI update)")
            self.init(mode: .Unknown, place: .Unknown)
        }
    }
}
