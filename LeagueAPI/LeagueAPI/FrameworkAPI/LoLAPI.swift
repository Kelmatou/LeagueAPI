//
//  LoLAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/20/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class LoLAPI: APIClient {
    
    // MARK: - Champion Mastery
    
    public func getChampionMasteries(by summonerId: SummonerId, on region: Region, handler: @escaping ([ChampionMastery]?, String?) -> Void) {
        ChampionMasteryBusiness.getMastery(method: .BySummonerId(id: summonerId), region: region, key: self.key, handler: handler)
    }
    
    public func getChampionMastery(by summonerId: SummonerId, for championId: ChampionId, on region: Region, handler: @escaping (ChampionMastery?, String?) -> Void) {
        ChampionMasteryBusiness.getMastery(method: .BySummonerIdAndChampionId(summonerId: summonerId, championId: championId), region: region, key: self.key, handler: handler)
    }
    
    public func getMasteryScore(for summonerId: SummonerId, on region: Region, handler: @escaping (Int?, String?) -> Void) {
        ChampionMasteryBusiness.getMastery(method: .ScoreBySummonerId(id: summonerId), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Champion
    
    public func getChampionRotation(on region: Region, handler: @escaping (ChampionRotations?, String?) -> Void) {
        ChampionBusiness.getChampion(method: .ChampionRotation, region: region, key: self.key, handler: handler)
    }

    // MARK: - Clash
       
    public func getClashPlayers(by summonerId: SummonerId, on region: Region, handler: @escaping ([ClashPlayer]?, String?) -> Void) {
        ClashBusiness.getClashData(method: .PlayersBySummonerId(summonerId: summonerId), region: region, key: self.key, handler: handler)
    }
    
    public func getClashTeam(by teamId: TeamId, on region: Region, handler: @escaping (ClashTeam?, String?) -> Void) {
        ClashBusiness.getClashData(method: .TeamsByTeamId(teamId: teamId), region: region, key: self.key, handler: handler)
    }
    
    public func getClashTournaments(on region: Region, handler: @escaping ([ClashTournament]?, String?) -> Void) {
        ClashBusiness.getClashData(method: .Tournaments, region: region, key: self.key, handler: handler)
    }
    
    public func getClashTournament(by teamId: TeamId, on region: Region, handler: @escaping (ClashTournament?, String?) -> Void) {
        ClashBusiness.getClashData(method: .TournamentsByTeamId(teamId: teamId), region: region, key: self.key, handler: handler)
    }
    
    public func getClashTournament(by tournamentId: TournamentId, on region: Region, handler: @escaping (ClashTournament?, String?) -> Void) {
        ClashBusiness.getClashData(method: .TournamentsByTournamentId(tournamentId: tournamentId), region: region, key: self.key, handler: handler)
    }

    // MARK: - Ranked - EXP
    
    public func getQueueEntriesExp(on region: Region, queue: Queue, division: RankedDivision, page: Int = 1, handler: @escaping ([RankedEntry]?, String?) -> Void) {
        RankedExpBusiness.getRankedExp(method: .QueueEntries(queue: queue, division: division, page: page), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Ranked
    
    public func getChallengerLeague(for queue: Queue, on region: Region, handler: @escaping (League?, String?) -> Void) {
        RankedBusiness.getRanked(method: .ChallengerByQueue(queue: queue), region: region, key: self.key, handler: handler)
    }
    
    public func getGrandMasterLeague(for queue: Queue, on region: Region, handler: @escaping (League?, String?) -> Void) {
        RankedBusiness.getRanked(method: .GrandMasterByQueue(queue: queue), region: region, key: self.key, handler: handler)
    }
    
    public func getLeague(by leagueId: LeagueId, on region: Region, handler: @escaping (League?, String?) -> Void) {
        RankedBusiness.getRanked(method: .LeagueById(id: leagueId), region: region, key: self.key, handler: handler)
    }
    
    public func getMasterLeague(for queue: Queue, on region: Region, handler: @escaping (League?, String?) -> Void) {
        RankedBusiness.getRanked(method: .MasterByQueue(queue: queue), region: region, key: self.key, handler: handler)
    }
    
    public func getRankedEntries(for summonerId: SummonerId, on region: Region, handler: @escaping ([RankedEntry]?, String?) -> Void) {
        RankedBusiness.getRanked(method: .EntriesById(id: summonerId), region: region, key: self.key, handler: handler)
    }
    
    public func getRankedEntry(for summonerId: SummonerId, in queue: Queue, on region: Region, handler: @escaping (RankedEntry?, String?) -> Void) {
        RankedBusiness.getRankedEntry(in: queue, method: .EntriesById(id: summonerId), region: region, key: self.key, handler: handler)
    }
    
    public func getQueueEntries(on region: Region, queue: Queue, division: RankedDivision, page: Int = 1, handler: @escaping ([RankedEntry]?, String?) -> Void) {
        RankedBusiness.getRanked(method: .QueueEntries(queue: queue, division: division, page: page), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Status
    
    public func getStatus(on region: Region, handler: @escaping (ServiceStatus?, String?) -> Void) {
        StatusBusiness.getStatus(method: .GetStatus, region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Match
    
    public func getMatch(by gameId: GameId, on region: Region, handler: @escaping (Match?, String?) -> Void) {
        MatchBusiness.getMatch(method: .ById(id: gameId), region: region, key: self.key, handler: handler)
    }
    
    public func getMatchList(by accountId: AccountId, on region: Region, beginTime: Datetime? = nil, endTime: Datetime? = nil, beginIndex: Int? = nil, endIndex: Int? = nil, championId: ChampionId? = nil, queue: QueueMode? = nil, season: Season? = nil, handler: @escaping (MatchList?, String?) -> Void) {
        MatchBusiness.getMatch(method: .MatchesByAccountId(id: accountId, beginTime: beginTime, endTime: endTime, beginIndex: beginIndex, endIndex: endIndex, championId: championId, queue: queue, season: season), region: region, key: self.key, handler: handler)
    }
    
    public func getMatchTimeline(by gameId: GameId, on region: Region, handler: @escaping (MatchTimeline?, String?) -> Void) {
        MatchBusiness.getMatch(method: .TimelineById(id: gameId), region: region, key: self.key, handler: handler)
    }
    
    public func getMatchIds(by tournamentCode: TournamentCode, on region: Region, handler: @escaping ([GameId]?, String?) -> Void) {
        let handlerIds: ([Long]?, String?) -> Void = { (ids, error) in
            handler(ids?.map { GameId($0) }, error)
        }
        MatchBusiness.getMatch(method: .MatchIdsByTournamentCode(code: tournamentCode), region: region, key: self.key, handler: handlerIds)
    }
    
    public func getMatch(by gameId: GameId, and tournamentCode: TournamentCode, on region: Region, handler: @escaping (Match?, String?) -> Void) {
        MatchBusiness.getMatch(method: .ByIdAndTournamentCode(id: gameId, code: tournamentCode), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Spectator
    
    public func getLiveGame(by summonerId: SummonerId, on region: Region, handler: @escaping (GameInfo?, String?) -> Void) {
        SpectatorBusiness.getCurrentGame(method: .BySummonerId(id: summonerId), region: region, key: self.key, handler: handler)
    }
    
    public func getFeaturedGames(on region: Region, handler: @escaping (FeaturedGames?, String?) -> Void) {
        SpectatorBusiness.getCurrentGame(method: .FeaturedGames, region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Summoner
    
    public func getSummoner(by accountId: AccountId, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        SummonerBusiness.getSummoner(method: .ByAccountId(id: accountId), region: region, key: self.key, handler: handler)
    }
    
    public func getSummoner(byName name: String, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        SummonerBusiness.getSummoner(method: .ByName(name: name), region: region, key: self.key, handler: handler)
    }
    
    public func getSummoner(by puuid: SummonerPuuid, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        SummonerBusiness.getSummoner(method: .byPuuid(puuid: puuid), region: region, key: self.key, handler: handler)
    }
    
    public func getSummoner(by summonerId: SummonerId, on region: Region, handler: @escaping (Summoner?, String?) -> Void) {
        SummonerBusiness.getSummoner(method: .ById(id: summonerId), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Third Party Code
    
    public func getThirdPartyVerificationCode(by summonerId: SummonerId, on region: Region, handler: @escaping (String?, String?) -> Void) {
        ThirdPartyCodeBusiness.getVerificationCode(method: .ById(id: summonerId), region: region, key: self.key, handler: handler)
    }
    
    // MARK: - Tournament Stub
    
    public func newStubTournament(hostRegion: TournamentRegion, named name: String, hostUrl: String, amount: Int? = nil, info: TournamentInfo, handler: @escaping ((ProviderId, TournamentId, [TournamentCode])?, String?) -> Void) {
        createStubTournamentProvider(hostRegion: hostRegion, hostUrl: hostUrl) { (providerId, error) in
            guard let providerId = providerId, error == nil else { handler(nil, error); return }
            self.createStubTournament(providerId: providerId, named: name) { (tournamentId, error) in
                guard let tournamentId = tournamentId, error == nil else { handler(nil, error); return }
                self.createStubTournamentCode(tournamentId: tournamentId, amount: amount, info: info) { (codes, error) in
                    handler((providerId, tournamentId, codes ?? []), error)
                }
            }
        }
    }
    
    public func createStubTournamentCode(tournamentId: TournamentId, amount: Int? = nil, info: TournamentInfo, handler: @escaping ([TournamentCode]?, String?) -> Void) {
        let handlerCodes: ([String]?, String?) -> Void = { (codes, error) in
            handler(codes?.map { TournamentCode($0) }, error)
        }
        TournamentStubBusiness.manageTournament(method: .CreateCodes(amount: amount, tournamentId: tournamentId, info: info), key: self.key, handler: handlerCodes)
    }
    
    public func getStubTournamentEvents(tournamentCode: TournamentCode, handler: @escaping ([TournamentEvent]?, String?) -> Void) {
        TournamentStubBusiness.getTournamentEvents(method: .EventsByTournamentCode(code: tournamentCode), key: self.key, handler: handler)
    }
    
    public func createStubTournamentProvider(hostRegion: TournamentRegion, hostUrl: String, handler: @escaping (ProviderId?, String?) -> Void) {
        let handlerId: (Int?, String?) -> Void = { (id, error) in
            handler(id == nil ? nil : ProviderId(id!), error)
        }
        TournamentStubBusiness.manageTournament(method: .CreateProvider(callbackUrl: hostUrl, region: hostRegion), key: self.key, handler: handlerId)
    }
    
    public func createStubTournament(providerId: ProviderId, named name: String, handler: @escaping (TournamentId?, String?) -> Void) {
        let handlerId: (Long?, String?) -> Void = { (id, error) in
            handler(id == nil ? nil : TournamentId(id!), error)
        }
        TournamentStubBusiness.manageTournament(method: .CreateTournament(name: name, providerId: providerId), key: self.key, handler: handlerId)
    }
    
    // MARK: - Tournament
    
    public func newTournament(hostRegion: TournamentRegion, named name: String, hostUrl: String, amount: Int? = nil, info: TournamentInfo, handler: @escaping ((ProviderId, TournamentId, [TournamentCode])?, String?) -> Void) {
        createTournamentProvider(hostRegion: hostRegion, hostUrl: hostUrl) { (providerId, error) in
            guard let providerId = providerId, error == nil else { handler(nil, error); return }
            self.createTournament(providerId: providerId, named: name) { (tournamentId, error) in
                guard let tournamentId = tournamentId, error == nil else { handler(nil, error); return }
                self.createTournamentCode(tournamentId: tournamentId, amount: amount, info: info) { (codes, error) in
                    handler((providerId, tournamentId, codes ?? []), error)
                }
            }
        }
    }
    
    public func createTournamentCode(tournamentId: TournamentId, amount: Int? = nil, info: TournamentInfo, handler: @escaping ([TournamentCode]?, String?) -> Void) {
        let handlerCodes: ([String]?, String?) -> Void = { (codes, error) in
            handler(codes?.map { TournamentCode($0) }, error)
        }
        TournamentBusiness.manageTournament(method: .CreateCodes(amount: amount, tournamentId: tournamentId, info: info), key: self.key, handler: handlerCodes)
    }
    
    public func updateTournament(tournamentCode: TournamentCode, updatedInfo: TournamentUpdate? = nil, handler: @escaping (String?) -> Void) {
        let errorHandler: (EmptyReply?, String?) -> Void = { (_, error) in
            handler(error)
        }
        TournamentBusiness.manageTournament(method: .UpdateTournamentInfo(code: tournamentCode, updatedInfo: updatedInfo), key: self.key, handler: errorHandler)
    }
    
    public func getTournamentInfo(tournamentCode: TournamentCode, handler: @escaping (TournamentDetails?, String?) -> Void) {
        TournamentBusiness.manageTournament(method: .GetTournamentInfo(code: tournamentCode), key: self.key, handler: handler)
    }
    
    public func getTournamentEvents(tournamentCode: TournamentCode, handler: @escaping ([TournamentEvent]?, String?) -> Void) {
        TournamentBusiness.getTournamentEvents(method: .EventsByTournamentCode(code: tournamentCode), key: self.key, handler: handler)
    }
    
    public func createTournamentProvider(hostRegion: TournamentRegion, hostUrl: String, handler: @escaping (ProviderId?, String?) -> Void) {
        let handlerId: (Int?, String?) -> Void = { (id, error) in
            handler(id == nil ? nil : ProviderId(id!), error)
        }
        TournamentBusiness.manageTournament(method: .CreateProvider(callbackUrl: hostUrl, region: hostRegion), key: self.key, handler: handlerId)
    }
    
    public func createTournament(providerId: ProviderId, named name: String, handler: @escaping (TournamentId?, String?) -> Void) {
        let handlerId: (Long?, String?) -> Void = { (id, error) in
            handler(id == nil ? nil : TournamentId(id!), error)
        }
        TournamentBusiness.manageTournament(method: .CreateTournament(name: name, providerId: providerId), key: self.key, handler: handlerId)
    }
    
    // MARK - LeagueAPI Custom
    
    // MARK: - Service
    
    public func getPatchVersion(handler: @escaping (String?, String?) -> Void) {
        DataDragonVersionBusiness.getPatchVersion(completion: handler)
    }
    
    // MARK: - Champion
    
    public func getChampionDetails(by championId: ChampionId, handler: @escaping (ChampionDetails?, String?) -> Void) {
        DataDragonChampionBusiness.getChampionDetails(by: championId, completion: handler)
    }
    
    public func getChampionDetails(byName name: String, handler: @escaping (ChampionDetails?, String?) -> Void) {
        DataDragonChampionBusiness.getChampionDetails(byName: name, completion: handler)
    }
    
    public func getAllChampionIds(handler: @escaping ([ChampionId]?, String?) -> Void) {
        DataDragonChampionBusiness.getAllChampionIds(completion: handler)
    }
    
    public func getAllChampionNames(handler: @escaping ([String]?, String?) -> Void) {
        DataDragonChampionBusiness.getAllChampionNames(completion: handler)
    }
    
    public func getChampionNames(for role: ChampionRole, handler: @escaping ([String]?, String?) -> Void) {
        DataDragonChampionBusiness.getChampions(for: role, completion: handler)
    }
    
    // MARK: - Profile Icon
    
    public func getProfileIconIds(handler: @escaping ([ProfileIconId]?, String?) -> Void) {
        DataDragonProfileIconBusiness.getProfileIconIds(completion: handler)
    }
    
    public func getProfileIcon(by id: ProfileIconId, handler: @escaping (ProfileIcon?, String?) -> Void) {
        DataDragonProfileIconBusiness.getProfileIcon(by: id, completion: handler)
    }
    
    // MARK: - Summoner Spell
    
    public func getSummonerSpells(handler: @escaping ([SummonerSpell]?, String?) -> Void) {
        DataDragonSummonerSpellBusiness.getSummonerSpells(completion: handler)
    }
    
    public func getSummonerSpell(by id: SummonerSpellId, handler: @escaping (SummonerSpell?, String?) -> Void) {
        DataDragonSummonerSpellBusiness.getSummonerSpell(by: id, completion: handler)
    }
    
    public func getSummonerSpell(byName name: String, handler: @escaping (SummonerSpell?, String?) -> Void) {
        DataDragonSummonerSpellBusiness.getSummonerSpell(byName: name, completion: handler)
    }
    
    // MARK: - Item
    
    public func getItems(handler: @escaping ([Item]?, String?) -> Void) {
        DataDragonItemBusiness.getItems(completion: handler)
    }
    
    public func getItem(by id: ItemId, handler: @escaping (Item?, String?) -> Void) {
        DataDragonItemBusiness.getItem(by: id, completion: handler)
    }
    
    public func getItem(byName name: String, handler: @escaping (Item?, String?) -> Void) {
        DataDragonItemBusiness.getItem(byName: name, completion: handler)
    }
    
    public func getItems(byTag tag: String, handler: @escaping ([Item]?, String?) -> Void) {
        DataDragonItemBusiness.getItems(byTag: tag, completion: handler)
    }
    
    // MARK: - Rune
    
    public func getRunePaths(handler: @escaping ([RunePath]?, String?) -> Void) {
        DataDragonRuneBusiness.getRunePaths(completion: handler)
    }
    
    public func getRunePath(by id: RunePathId, handler: @escaping (RunePath?, String?) -> Void) {
        DataDragonRuneBusiness.getRunePath(by: id, completion: handler)
    }
    
    public func getRunePath(byName name: String, handler: @escaping (RunePath?, String?) -> Void) {
        DataDragonRuneBusiness.getRunePath(byName: name, completion: handler)
    }
    
    public func getRunes(forPathId pathId: RunePathId? = nil, handler: @escaping ([Rune]?, String?) -> Void) {
        DataDragonRuneBusiness.getRunes(forPathId: pathId, completion: handler)
    }
    
    public func getRune(by id: RuneId, handler: @escaping (Rune?, String?) -> Void) {
        DataDragonRuneBusiness.getRune(by: id, completion: handler)
    }
    
    public func getRune(byName name: String, handler: @escaping (Rune?, String?) -> Void) {
        DataDragonRuneBusiness.getRune(byName: name, completion: handler)
    }
    
    // MARK: - Ranked Emblems
    
    public func getEmblem(for tier: RankedTier) -> LAPIImage? {
        return RankedTierBusiness.getEmblem(for: tier)
    }
}

