//
//  MatchParticipantStats.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchParticipantStats: Decodable {
    
    public var participantId: Int
    public var win: Bool
    public var champLevel: Int
    public var goldEarned: Int
    public var goldSpent: Int
    public var item0: ItemId
    public var item1: ItemId
    public var item2: ItemId
    public var item3: ItemId
    public var item4: ItemId
    public var item5: ItemId
    public var item6: ItemId
    public var rune0: RuneId?
    public var rune1: RuneId?
    public var rune2: RuneId?
    public var rune3: RuneId?
    public var rune4: RuneId?
    public var rune5: RuneId?
    public var rune0Var1: Int?
    public var rune0Var2: Int?
    public var rune0Var3: Int?
    public var rune1Var1: Int?
    public var rune1Var2: Int?
    public var rune1Var3: Int?
    public var rune2Var1: Int?
    public var rune2Var2: Int?
    public var rune2Var3: Int?
    public var rune3Var1: Int?
    public var rune3Var2: Int?
    public var rune3Var3: Int?
    public var rune4Var1: Int?
    public var rune4Var2: Int?
    public var rune4Var3: Int?
    public var rune5Var1: Int?
    public var rune5Var2: Int?
    public var rune5Var3: Int?
    public var statPerk0: Int?
    public var statPerk1: Int?
    public var statPerk2: Int?
    public var doubleKills: Int
    public var tripleKills: Int
    public var quadraKills: Int
    public var pentaKills: Int
    public var totalPlayerScore: Int
    public var playerScore0: Int
    public var playerScore1: Int
    public var playerScore2: Int
    public var playerScore3: Int
    public var playerScore4: Int
    public var playerScore5: Int
    public var playerScore6: Int
    public var playerScore7: Int
    public var playerScore8: Int
    public var playerScore9: Int
    public var totalScoreRank: Int
    public var visionScore: Long
    public var firstBloodKill: Bool?
    public var firstBloodAssist: Bool?
    public var firstInhibitorKill: Bool?
    public var firstInhibitorAssist: Bool?
    public var firstTowerKill: Bool?
    public var firstTowerAssist: Bool?
    public var kills: Int
    public var deaths: Int
    public var assists: Int
    public var unrealKills: Int
    public var wardsPlaced: Int?
    public var wardsKilled: Int?
    public var sigthWardsBoughtInGame: Int?
    public var visionWardsBoughtInGame: Int?
    public var primaryRunePath: RunePathId?
    public var secondaryRunePath: RunePathId?
    public var neutralMinionsKilled: Int
    public var totalDamageDealt: Long
    public var totalDamageDealtToChampions: Long
    public var damageDealtToObjectives: Long
    public var damageDealtToTurrets: Long?
    public var trueDamageDealt: Long
    public var trueDamageDealtToChampions: Long
    public var magicDamageDealt: Long
    public var magicDamageDealtToChampions: Long
    public var physicalDamageDealt: Long
    public var physicalDamageDealtToChampions: Long
    public var totalDamageTaken: Long
    public var trueDamageTaken: Long
    public var magicalDamageTaken: Long
    public var physicalDamageTaken: Long
    public var damageSelfMitigated: Long
    public var totalHeal: Long
    public var totalUnitsHealed: Int
    public var largestMultiKill: Int
    public var largestCritialStrike: Int?
    public var largestKillingSpree: Int
    public var teamObjective: Int?
    public var combatPlayerScore: Int
    public var objectivePlayerScore: Int
    public var neutralMinionsKilledTeamJungle: Int?
    public var neutralMinionsKilledEnemyJungle: Int?
    public var killingSprees: Int
    public var inhibitorKills: Int?
    public var turretKills: Int?
    public var totalMinionsKilled: Int
    public var totalTimeCrowdControlDealt: Int
    public var longestTimeSpentLiving: Int
    public var timeCCingOthers: Long
    public var altarsCaptures: Int?
    public var altarsNeutralized: Int?
    public var nodeNeutralize: Int?
    public var nodeNeutralizeAssist: Int?
    public var nodeCaptureAssist: Int?
    
    enum CodingKeys: String, CodingKey {
        case participantId = "participantId"
        case win = "win"
        case champLevel = "champLevel"
        case goldEarned = "goldEarned"
        case goldSpent = "goldSpent"
        case item0 = "item0"
        case item1 = "item1"
        case item2 = "item2"
        case item3 = "item3"
        case item4 = "item4"
        case item5 = "item5"
        case item6 = "item6"
        case rune0 = "perk0"
        case rune1 = "perk1"
        case rune2 = "perk2"
        case rune3 = "perk3"
        case rune4 = "perk4"
        case rune5 = "perk5"
        case rune0Var1 = "perk0Var1"
        case rune0Var2 = "perk0Var2"
        case rune0Var3 = "perk0Var3"
        case rune1Var1 = "perk1Var1"
        case rune1Var2 = "perk1Var2"
        case rune1Var3 = "perk1Var3"
        case rune2Var1 = "perk2Var1"
        case rune2Var2 = "perk2Var2"
        case rune2Var3 = "perk2Var3"
        case rune3Var1 = "perk3Var1"
        case rune3Var2 = "perk3Var2"
        case rune3Var3 = "perk3Var3"
        case rune4Var1 = "perk4Var1"
        case rune4Var2 = "perk4Var2"
        case rune4Var3 = "perk4Var3"
        case rune5Var1 = "perk5Var1"
        case rune5Var2 = "perk5Var2"
        case rune5Var3 = "perk5Var3"
        case statPerk0 = "statPerk0"
        case statPerk1 = "statPerk1"
        case statPerk2 = "statPerk2"
        case doubleKills = "doubleKills"
        case tripleKills = "tripleKills"
        case quadraKills = "quadraKills"
        case pentaKills = "pentaKills"
        case totalPlayerScore = "totalPlayerScore"
        case playerScore0 = "playerScore0"
        case playerScore1 = "playerScore1"
        case playerScore2 = "playerScore2"
        case playerScore3 = "playerScore3"
        case playerScore4 = "playerScore4"
        case playerScore5 = "playerScore5"
        case playerScore6 = "playerScore6"
        case playerScore7 = "playerScore7"
        case playerScore8 = "playerScore8"
        case playerScore9 = "playerScore9"
        case totalScoreRank = "totalScoreRank"
        case visionScore = "visionScore"
        case firstBloodKill = "firstBloodKill"
        case firstBloodAssist = "firstBloodAssist"
        case firstInhibitorKill = "firstInhibitorKill"
        case firstInhibitorAssist = "firstInhibitorAssist"
        case firstTowerKill = "firstTowerKill"
        case firstTowerAssist = "firstTowerAssist"
        case kills = "kills"
        case deaths = "deaths"
        case assists = "assists"
        case unrealKills = "unrealKills"
        case wardsPlaced = "wardsPlaced"
        case wardsKilled = "wardsKilled"
        case sigthWardsBoughtInGame = "sigthWardsBoughtInGame"
        case visionWardsBoughtInGame = "visionWardsBoughtInGame"
        case primaryRunePath = "perkPrimaryStyle"
        case secondaryRunePath = "perkSubStyle"
        case neutralMinionsKilled = "neutralMinionsKilled"
        case totalDamageDealt = "totalDamageDealt"
        case totalDamageDealtToChampions = "totalDamageDealtToChampions"
        case damageDealtToObjectives = "damageDealtToObjectives"
        case damageDealtToTurrets = "damageDealtToTurrets"
        case trueDamageDealt = "trueDamageDealt"
        case trueDamageDealtToChampions = "trueDamageDealtToChampions"
        case magicDamageDealt = "magicDamageDealt"
        case magicDamageDealtToChampions = "magicDamageDealtToChampions"
        case physicalDamageDealt = "physicalDamageDealt"
        case physicalDamageDealtToChampions = "physicalDamageDealtToChampions"
        case totalDamageTaken = "totalDamageTaken"
        case trueDamageTaken = "trueDamageTaken"
        case magicalDamageTaken = "magicalDamageTaken"
        case physicalDamageTaken = "physicalDamageTaken"
        case damageSelfMitigated = "damageSelfMitigated"
        case totalHeal = "totalHeal"
        case totalUnitsHealed = "totalUnitsHealed"
        case largestMultiKill = "largestMultiKill"
        case largestCritialStrike = "largestCritialStrike"
        case largestKillingSpree = "largestKillingSpree"
        case teamObjective = "teamObjective"
        case combatPlayerScore = "combatPlayerScore"
        case objectivePlayerScore = "objectivePlayerScore"
        case neutralMinionsKilledTeamJungle = "neutralMinionsKilledTeamJungle"
        case neutralMinionsKilledEnemyJungle = "neutralMinionsKilledEnemyJungle"
        case killingSprees = "killingSprees"
        case inhibitorKills = "inhibitorKills"
        case turretKills = "turretKills"
        case totalMinionsKilled = "totalMinionsKilled"
        case totalTimeCrowdControlDealt = "totalTimeCrowdControlDealt"
        case longestTimeSpentLiving = "longestTimeSpentLiving"
        case timeCCingOthers = "timeCCingOthers"
        case altarsCaptures = "altarsCaptures"
        case altarsNeutralized = "altarsNeutralized"
        case nodeNeutralize = "nodeNeutralize"
        case nodeNeutralizeAssist = "nodeNeutralizeAssist"
        case nodeCaptureAssist = "nodeCaptureAssist"
    }
    
    public init(participantId: Int, win: Bool, champLevel: Int, goldEarned: Int, goldSpent: Int, item0: ItemId, item1: ItemId, item2: ItemId, item3: ItemId, item4: ItemId, item5: ItemId, item6: ItemId, rune0: RuneId?, rune1: RuneId?, rune2: RuneId?, rune3: RuneId?, rune4: RuneId?, rune5: RuneId?, rune0Var1: Int?, rune0Var2: Int?, rune0Var3: Int?, rune1Var1: Int?, rune1Var2: Int?, rune1Var3: Int?, rune2Var1: Int?, rune2Var2: Int?, rune2Var3: Int?, rune3Var1: Int?, rune3Var2: Int?, rune3Var3: Int?, rune4Var1: Int?, rune4Var2: Int?, rune4Var3: Int?, rune5Var1: Int?, rune5Var2: Int?, rune5Var3: Int?, statPerk0: Int?, statPerk1: Int?, statPerk2: Int?, doubleKills: Int, tripleKills: Int, quadraKills: Int, pentaKills: Int, totalPlayerScore: Int, playerScore0: Int, playerScore1: Int, playerScore2: Int, playerScore3: Int, playerScore4: Int, playerScore5: Int, playerScore6: Int, playerScore7: Int, playerScore8: Int, playerScore9: Int, totalScoreRank: Int, visionScore: Long, firstBloodKill: Bool?, firstBloodAssist: Bool?, firstInhibitorKill: Bool?, firstInhibitorAssist: Bool?, firstTowerKill: Bool?, firstTowerAssist: Bool?, kills: Int, deaths: Int, assists: Int, unrealKills: Int, wardsPlaced: Int?, wardsKilled: Int?, sigthWardsBoughtInGame: Int?, visionWardsBoughtInGame: Int?, primaryRunePath: RunePathId?, secondaryRunePath: RunePathId?, neutralMinionsKilled: Int, totalDamageDealt: Long, totalDamageDealtToChampions: Long, damageDealtToObjectives: Long, damageDealtToTurrets: Long?, trueDamageDealt: Long, trueDamageDealtToChampions: Long, magicDamageDealt: Long, magicDamageDealtToChampions: Long, physicalDamageDealt: Long, physicalDamageDealtToChampions: Long, totalDamageTaken: Long, trueDamageTaken: Long, magicalDamageTaken: Long, physicalDamageTaken: Long, damageSelfMitigated: Long, totalHeal: Long, totalUnitsHealed: Int, largestMultiKill: Int, largestCritialStrike: Int?, largestKillingSpree: Int, teamObjective: Int?, combatPlayerScore: Int, objectivePlayerScore: Int, neutralMinionsKilledTeamJungle: Int?, neutralMinionsKilledEnemyJungle: Int?, killingSprees: Int, inhibitorKills: Int?, turretKills: Int?, totalMinionsKilled: Int, totalTimeCrowdControlDealt: Int, longestTimeSpentLiving: Int, timeCCingOthers: Long, altarsCaptures: Int?, altarsNeutralized: Int?, nodeNeutralize: Int?, nodeNeutralizeAssist: Int?, nodeCaptureAssist: Int?) {
        self.participantId = participantId
        self.win = win
        self.champLevel = champLevel
        self.goldEarned = goldEarned
        self.goldSpent = goldSpent
        self.item0 = item0
        self.item1 = item1
        self.item2 = item2
        self.item3 = item3
        self.item4 = item4
        self.item5 = item5
        self.item6 = item6
        self.rune0 = rune0
        self.rune1 = rune1
        self.rune2 = rune2
        self.rune3 = rune3
        self.rune4 = rune4
        self.rune5 = rune5
        self.rune0Var1 = rune0Var1
        self.rune0Var2 = rune0Var2
        self.rune0Var3 = rune0Var3
        self.rune1Var1 = rune1Var1
        self.rune1Var2 = rune1Var2
        self.rune1Var3 = rune1Var3
        self.rune2Var1 = rune2Var1
        self.rune2Var2 = rune2Var2
        self.rune2Var3 = rune2Var3
        self.rune3Var1 = rune3Var1
        self.rune3Var2 = rune2Var2
        self.rune3Var3 = rune3Var3
        self.rune4Var1 = rune4Var1
        self.rune4Var2 = rune4Var2
        self.rune4Var3 = rune4Var3
        self.rune5Var1 = rune5Var1
        self.rune5Var2 = rune5Var2
        self.rune5Var3 = rune5Var3
        self.statPerk0 = statPerk0
        self.statPerk1 = statPerk1
        self.statPerk2 = statPerk2
        self.doubleKills = doubleKills
        self.tripleKills = tripleKills
        self.quadraKills = quadraKills
        self.pentaKills = pentaKills
        self.totalPlayerScore = totalPlayerScore
        self.playerScore0 = playerScore0
        self.playerScore1 = playerScore1
        self.playerScore2 = playerScore2
        self.playerScore3 = playerScore3
        self.playerScore4 = playerScore4
        self.playerScore5 = playerScore5
        self.playerScore6 = playerScore6
        self.playerScore7 = playerScore7
        self.playerScore8 = playerScore8
        self.playerScore9 = playerScore9
        self.totalScoreRank = totalScoreRank
        self.visionScore = visionScore
        self.firstBloodKill = firstBloodKill
        self.firstBloodAssist = firstBloodAssist
        self.firstInhibitorKill = firstInhibitorKill
        self.firstInhibitorAssist = firstInhibitorAssist
        self.firstTowerKill = firstTowerKill
        self.firstTowerAssist = firstTowerAssist
        self.kills = kills
        self.deaths = deaths
        self.assists = assists
        self.unrealKills = unrealKills
        self.wardsPlaced = wardsPlaced
        self.wardsKilled = wardsKilled
        self.sigthWardsBoughtInGame = sigthWardsBoughtInGame
        self.visionWardsBoughtInGame = visionWardsBoughtInGame
        self.primaryRunePath = primaryRunePath
        self.secondaryRunePath = secondaryRunePath
        self.neutralMinionsKilled = neutralMinionsKilled
        self.totalDamageDealt = totalDamageDealt
        self.totalDamageDealtToChampions = totalDamageDealtToChampions
        self.damageDealtToObjectives = damageDealtToObjectives
        self.damageDealtToTurrets = damageDealtToTurrets
        self.trueDamageDealt = trueDamageDealt
        self.trueDamageDealtToChampions = trueDamageDealtToChampions
        self.magicDamageDealt = magicDamageDealt
        self.magicDamageDealtToChampions = magicDamageDealtToChampions
        self.physicalDamageDealt = physicalDamageDealt
        self.physicalDamageDealtToChampions = physicalDamageDealtToChampions
        self.totalDamageTaken = totalDamageTaken
        self.trueDamageTaken = trueDamageTaken
        self.magicalDamageTaken = magicalDamageTaken
        self.physicalDamageTaken = physicalDamageTaken
        self.damageSelfMitigated = damageSelfMitigated
        self.totalHeal = totalHeal
        self.totalUnitsHealed = totalUnitsHealed
        self.largestMultiKill = largestMultiKill
        self.largestCritialStrike = largestCritialStrike
        self.largestKillingSpree = largestKillingSpree
        self.teamObjective = teamObjective
        self.combatPlayerScore = combatPlayerScore
        self.objectivePlayerScore = objectivePlayerScore
        self.neutralMinionsKilledTeamJungle = neutralMinionsKilledTeamJungle
        self.neutralMinionsKilledEnemyJungle = neutralMinionsKilledEnemyJungle
        self.killingSprees = killingSprees
        self.inhibitorKills = inhibitorKills
        self.turretKills = turretKills
        self.totalMinionsKilled = totalMinionsKilled
        self.totalTimeCrowdControlDealt = totalTimeCrowdControlDealt
        self.longestTimeSpentLiving = longestTimeSpentLiving
        self.timeCCingOthers = timeCCingOthers
        self.altarsCaptures = altarsCaptures
        self.altarsNeutralized = altarsNeutralized
        self.nodeNeutralize = nodeNeutralize
        self.nodeNeutralizeAssist = nodeNeutralizeAssist
        self.nodeCaptureAssist = nodeCaptureAssist
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.participantId = try container.decode(Int.self, forKey: .participantId)
        self.win = try container.decode(Bool.self, forKey: .win)
        self.champLevel = try container.decode(Int.self, forKey: .champLevel)
        self.goldEarned = try container.decode(Int.self, forKey: .goldEarned)
        self.goldSpent = try container.decode(Int.self, forKey: .goldSpent)
        self.item0 = try ItemId(container.decode(Int.self, forKey: .item0))
        self.item1 = try ItemId(container.decode(Int.self, forKey: .item1))
        self.item2 = try ItemId(container.decode(Int.self, forKey: .item2))
        self.item3 = try ItemId(container.decode(Int.self, forKey: .item3))
        self.item4 = try ItemId(container.decode(Int.self, forKey: .item4))
        self.item5 = try ItemId(container.decode(Int.self, forKey: .item5))
        self.item6 = try ItemId(container.decode(Int.self, forKey: .item6))
        self.rune0 = try? RuneId(container.decode(Long.self, forKey: .rune0))
        self.rune1 = try? RuneId(container.decode(Long.self, forKey: .rune1))
        self.rune2 = try? RuneId(container.decode(Long.self, forKey: .rune2))
        self.rune3 = try? RuneId(container.decode(Long.self, forKey: .rune3))
        self.rune4 = try? RuneId(container.decode(Long.self, forKey: .rune4))
        self.rune5 = try? RuneId(container.decode(Long.self, forKey: .rune5))
        self.rune0Var1 = try? container.decode(Int.self, forKey: .rune0Var1)
        self.rune0Var2 = try? container.decode(Int.self, forKey: .rune0Var2)
        self.rune0Var3 = try? container.decode(Int.self, forKey: .rune0Var3)
        self.rune1Var1 = try? container.decode(Int.self, forKey: .rune1Var1)
        self.rune1Var2 = try? container.decode(Int.self, forKey: .rune1Var2)
        self.rune1Var3 = try? container.decode(Int.self, forKey: .rune1Var3)
        self.rune2Var1 = try? container.decode(Int.self, forKey: .rune2Var1)
        self.rune2Var2 = try? container.decode(Int.self, forKey: .rune2Var2)
        self.rune2Var3 = try? container.decode(Int.self, forKey: .rune2Var3)
        self.rune3Var1 = try? container.decode(Int.self, forKey: .rune3Var1)
        self.rune3Var2 = try? container.decode(Int.self, forKey: .rune3Var2)
        self.rune3Var3 = try? container.decode(Int.self, forKey: .rune3Var3)
        self.rune4Var1 = try? container.decode(Int.self, forKey: .rune4Var1)
        self.rune4Var2 = try? container.decode(Int.self, forKey: .rune4Var2)
        self.rune4Var3 = try? container.decode(Int.self, forKey: .rune4Var3)
        self.rune5Var1 = try? container.decode(Int.self, forKey: .rune5Var1)
        self.rune5Var2 = try? container.decode(Int.self, forKey: .rune5Var2)
        self.rune5Var3 = try? container.decode(Int.self, forKey: .rune5Var3)
        self.statPerk0 = try? container.decode(Int.self, forKey: .statPerk0)
        self.statPerk1 = try? container.decode(Int.self, forKey: .statPerk1)
        self.statPerk2 = try? container.decode(Int.self, forKey: .statPerk2)
        self.doubleKills = try container.decode(Int.self, forKey: .doubleKills)
        self.tripleKills = try container.decode(Int.self, forKey: .tripleKills)
        self.quadraKills = try container.decode(Int.self, forKey: .quadraKills)
        self.pentaKills = try container.decode(Int.self, forKey: .pentaKills)
        self.totalPlayerScore = try container.decode(Int.self, forKey: .totalPlayerScore)
        self.playerScore0 = try container.decode(Int.self, forKey: .playerScore0)
        self.playerScore1 = try container.decode(Int.self, forKey: .playerScore1)
        self.playerScore2 = try container.decode(Int.self, forKey: .playerScore2)
        self.playerScore3 = try container.decode(Int.self, forKey: .playerScore3)
        self.playerScore4 = try container.decode(Int.self, forKey: .playerScore4)
        self.playerScore5 = try container.decode(Int.self, forKey: .playerScore5)
        self.playerScore6 = try container.decode(Int.self, forKey: .playerScore6)
        self.playerScore7 = try container.decode(Int.self, forKey: .playerScore7)
        self.playerScore8 = try container.decode(Int.self, forKey: .playerScore8)
        self.playerScore9 = try container.decode(Int.self, forKey: .playerScore9)
        self.totalScoreRank = try container.decode(Int.self, forKey: .totalScoreRank)
        self.visionScore = try container.decode(Long.self, forKey: .visionScore)
        self.firstBloodKill = try? container.decode(Bool.self, forKey: .firstBloodKill)
        self.firstBloodAssist = try? container.decode(Bool.self, forKey: .firstBloodAssist)
        self.firstInhibitorKill = try? container.decode(Bool.self, forKey: .firstInhibitorKill)
        self.firstInhibitorAssist = try? container.decode(Bool.self, forKey: .firstInhibitorAssist)
        self.firstTowerKill = try? container.decode(Bool.self, forKey: .firstTowerKill)
        self.firstTowerAssist = try? container.decode(Bool.self, forKey: .firstTowerAssist)
        self.kills = try container.decode(Int.self, forKey: .kills)
        self.deaths = try container.decode(Int.self, forKey: .deaths)
        self.assists = try container.decode(Int.self, forKey: .assists)
        self.unrealKills = try container.decode(Int.self, forKey: .unrealKills)
        self.wardsPlaced = try? container.decode(Int.self, forKey: .wardsPlaced)
        self.wardsKilled = try? container.decode(Int.self, forKey: .wardsKilled)
        self.sigthWardsBoughtInGame = try? container.decode(Int.self, forKey: .sigthWardsBoughtInGame)
        self.visionWardsBoughtInGame = try? container.decode(Int.self, forKey: .visionWardsBoughtInGame)
        self.primaryRunePath = try? RunePathId(container.decode(Long.self, forKey: .primaryRunePath))
        self.secondaryRunePath = try? RunePathId(container.decode(Long.self, forKey: .secondaryRunePath))
        self.neutralMinionsKilled = try container.decode(Int.self, forKey: .neutralMinionsKilled)
        self.totalDamageDealt = try container.decode(Long.self, forKey: .totalDamageDealt)
        self.totalDamageDealtToChampions = try container.decode(Long.self, forKey: .totalDamageDealtToChampions)
        self.damageDealtToObjectives = try container.decode(Long.self, forKey: .damageDealtToObjectives)
        self.damageDealtToTurrets = try? container.decode(Long.self, forKey: .damageDealtToTurrets)
        self.trueDamageDealt = try container.decode(Long.self, forKey: .trueDamageDealt)
        self.trueDamageDealtToChampions = try container.decode(Long.self, forKey: .trueDamageDealtToChampions)
        self.magicDamageDealt = try container.decode(Long.self, forKey: .magicDamageDealt)
        self.magicDamageDealtToChampions = try container.decode(Long.self, forKey: .magicDamageDealtToChampions)
        self.physicalDamageDealt = try container.decode(Long.self, forKey: .physicalDamageDealt)
        self.physicalDamageDealtToChampions = try container.decode(Long.self, forKey: .physicalDamageDealtToChampions)
        self.totalDamageTaken = try container.decode(Long.self, forKey: .totalDamageTaken)
        self.trueDamageTaken = try container.decode(Long.self, forKey: .trueDamageTaken)
        self.magicalDamageTaken = try container.decode(Long.self, forKey: .magicalDamageTaken)
        self.physicalDamageTaken = try container.decode(Long.self, forKey: .physicalDamageTaken)
        self.damageSelfMitigated = try container.decode(Long.self, forKey: .damageSelfMitigated)
        self.totalHeal = try container.decode(Long.self, forKey: .totalHeal)
        self.totalUnitsHealed = try container.decode(Int.self, forKey: .totalUnitsHealed)
        self.largestMultiKill = try container.decode(Int.self, forKey: .largestMultiKill)
        self.largestCritialStrike = try? container.decode(Int.self, forKey: .largestCritialStrike)
        self.largestKillingSpree = try container.decode(Int.self, forKey: .largestKillingSpree)
        self.teamObjective = try? container.decode(Int.self, forKey: .teamObjective)
        self.combatPlayerScore = try container.decode(Int.self, forKey: .combatPlayerScore)
        self.objectivePlayerScore = try container.decode(Int.self, forKey: .objectivePlayerScore)
        self.neutralMinionsKilledTeamJungle = try? container.decode(Int.self, forKey: .neutralMinionsKilledTeamJungle)
        self.neutralMinionsKilledEnemyJungle = try? container.decode(Int.self, forKey: .neutralMinionsKilledEnemyJungle)
        self.killingSprees = try container.decode(Int.self, forKey: .killingSprees)
        self.inhibitorKills = try? container.decode(Int.self, forKey: .inhibitorKills)
        self.turretKills = try? container.decode(Int.self, forKey: .turretKills)
        self.totalMinionsKilled = try container.decode(Int.self, forKey: .totalMinionsKilled)
        self.totalTimeCrowdControlDealt = try container.decode(Int.self, forKey: .totalTimeCrowdControlDealt)
        self.longestTimeSpentLiving = try container.decode(Int.self, forKey: .longestTimeSpentLiving)
        self.timeCCingOthers = try container.decode(Long.self, forKey: .timeCCingOthers)
        self.altarsCaptures = try? container.decode(Int.self, forKey: .altarsCaptures)
        self.altarsNeutralized = try? container.decode(Int.self, forKey: .altarsNeutralized)
        self.nodeNeutralize = try? container.decode(Int.self, forKey: .nodeNeutralize)
        self.nodeNeutralizeAssist = try? container.decode(Int.self, forKey: .nodeNeutralizeAssist)
        self.nodeCaptureAssist = try? container.decode(Int.self, forKey: .nodeCaptureAssist)
    }
}
