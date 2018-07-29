//
//  TournamentStubBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class TournamentStubBusiness {
    
    public static func manageTournament(method: TournamentStubMethod.TournamentStubMethods, region: Region, key: APIKey, handler: @escaping (Summoner?, String?) -> Void) {
        let tournamentMethod: TournamentStubMethod = TournamentStubMethod(method: method, region: region)
        let tournamentBusiness: APIBusiness = APIBusiness(key: key, method: tournamentMethod)
        tournamentBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
