//
//  MethodPaths.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/27/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal enum MethodPaths: String {
    case RiotAccount = "/riot/account"
    case ChampionMastery = "/lol/champion-mastery"
    case Clash = "/lol/clash"
    case LeagueExp = "/lol/league-exp"
    case League = "/lol/league"
    case StaticData = "/lol/static-data"
    case Status = "/lol/status"
    case RunneteraRanked = "/lor/ranked"
    case Match = "/lol/match"
    case Spectator = "/lol/spectator"
    case Summoner = "/lol/summoner"
    case TFTLeague = "/tft/league"
    case TFTMatch = "/tft/match"
    case TFTSummoner = "/tft/summoner"
    case Platform = "/lol/platform" // Champion & ThirdPartyCode
    case TournamentStub = "/lol/tournament-stub"
    case Tournament = "/lol/tournament"
}
