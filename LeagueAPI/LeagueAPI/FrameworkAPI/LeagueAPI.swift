//
//  LeagueAPI.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class LeagueAPI: APIClient {
    
    public private(set) var riotAPI: RiotAPI
    
    public override init(APIToken: String) {
        self.riotAPI = RiotAPI(APIToken: APIToken)
        super.init(APIToken: APIToken)
    }
    
    // MARK: - Service
    
    public func getPatchVersion(handler: @escaping (String?, String?) -> Void) {
        DataDragonBusiness.getPatchVersion() { (version, error) in
            handler(version, error)
        }
    }
    
    // MARK: - Champion
    
    public func getChampionDetails(by championId: ChampionId, handler: @escaping (ChampionDetails?, String?) -> Void) {
        DataDragonBusiness.getChampionDetails(by: championId) { (championDetails, error) in
            handler(championDetails, error)
        }
    }
    
    public func getChampionDetails(by name: String, handler: @escaping (ChampionDetails?, String?) -> Void) {
        
    }
    
    // MARK: - Tournament Stub
    
    public func newStubTournament(hostRegion: TournamentRegion, named name: String, hostUrl: String, amount: Int? = nil, info: TournamentInfo, handler: @escaping ((ProviderId, TournamentId, [TournamentCode])?, String?) -> Void) {
        riotAPI.createStubTournamentProvider(hostRegion: hostRegion, hostUrl: hostUrl) { (providerId, error) in
            guard let providerId = providerId, error == nil else { handler(nil, error); return }
            self.riotAPI.createStubTournament(providerId: providerId, named: name) { (tournamentId, error) in
                guard let tournamentId = tournamentId, error == nil else { handler(nil, error); return }
                self.riotAPI.createStubTournamentCode(tournamentId: tournamentId, amount: amount, info: info) { (codes, error) in
                    handler((providerId, tournamentId, codes ?? []), error)
                }
            }
        }
    }
}
