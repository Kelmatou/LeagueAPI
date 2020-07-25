//
//  GameMode.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class GameMode {
    
    public enum GameModes: String {
        case Classic = "CLASSIC"
        case Odin = "ODIN"
        case Aram = "ARAM"
        case Tutorial = "TUTORIAL"
        case Urf = "URF"
        case DoomBotsTeemo = "DOOMBOTSTEEMO"
        case OneForAll = "ONEFORALL"
        case Ascension = "ASCENSION"
        case Firstblood = "FIRSTBLOOD"
        case KingPoro = "KINGPORO"
        case Siege = "SIEGE"
        case Assassinate = "ASSASSINATE"
        case Arsr = "ARSR"
        case DarkStar = "DARKSTAR"
        case StarGuardian = "STARGUARDIAN"
        case Project = "PROJECT"
        case NexusBlitzFirstEdition = "GAMEMODEX"
        case Odyssey = "ODYSSEY"
        case PraticeTool = "PRACTICETOOL"
        case SnowUrf = "SNOWURF"
        case TutorialModule1 = "TUTORIAL_MODULE_1"
        case TutorialModule2 = "TUTORIAL_MODULE_2"
        case TutorialModule3 = "TUTORIAL_MODULE_3"
        case TeamFightTactics = "TEAMFIGHTACTICS" // unverified
        case NexusBlitz = "NEXUSBLITZ"
        case Unknown = "Unknown"
    }
    
    public private(set) var mode: GameModes
    
    public init?(_ gameMode: GameModes) {
        guard gameMode != .Unknown else {
            Logger.error("GameMode instance cannot be created with \"Unknown\" value")
            return nil
        }
        self.mode = gameMode
    }
    
    internal init(_ gameMode: String) {
        switch gameMode {
        case GameModes.Classic.rawValue:
            self.mode = GameModes.Classic
        case GameModes.Odin.rawValue:
            self.mode = GameModes.Odin
        case GameModes.Aram.rawValue:
            self.mode = GameModes.Aram
        case GameModes.Tutorial.rawValue:
            self.mode = GameModes.Tutorial
        case GameModes.Urf.rawValue:
            self.mode = GameModes.Urf
        case GameModes.DoomBotsTeemo.rawValue:
            self.mode = GameModes.DoomBotsTeemo
        case GameModes.OneForAll.rawValue:
            self.mode = GameModes.OneForAll
        case GameModes.Ascension.rawValue:
            self.mode = GameModes.Ascension
        case GameModes.Firstblood.rawValue:
            self.mode = GameModes.Firstblood
        case GameModes.KingPoro.rawValue:
            self.mode = GameModes.KingPoro
        case GameModes.Siege.rawValue:
            self.mode = GameModes.Siege
        case GameModes.Assassinate.rawValue:
            self.mode = GameModes.Assassinate
        case GameModes.Arsr.rawValue:
            self.mode = GameModes.Arsr
        case GameModes.DarkStar.rawValue:
            self.mode = GameModes.DarkStar
        case GameModes.StarGuardian.rawValue:
            self.mode = GameModes.StarGuardian
        case GameModes.Project.rawValue:
            self.mode = GameModes.Project
        case GameModes.NexusBlitzFirstEdition.rawValue:
            self.mode = GameModes.NexusBlitzFirstEdition
        case GameModes.Odyssey.rawValue:
            self.mode = GameModes.Odyssey
        case GameModes.PraticeTool.rawValue:
            self.mode = GameModes.PraticeTool
        case GameModes.SnowUrf.rawValue:
            self.mode = GameModes.SnowUrf
        case GameModes.TutorialModule1.rawValue:
            self.mode = GameModes.TutorialModule1
        case GameModes.TutorialModule2.rawValue:
            self.mode = GameModes.TutorialModule2
        case GameModes.TutorialModule3.rawValue:
            self.mode = GameModes.TutorialModule3
        case GameModes.NexusBlitz.rawValue:
            self.mode = GameModes.NexusBlitz
        default:
            Logger.warning("Game mode \"\(gameMode)\" unknown (check for LeagueAPI update)")
            self.mode = .Unknown
        }
    }
}
