//
//  TournamentStubBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class TournamentStubBusiness {
    
    public static func getTournamentEvents(method: TournamentStubMethod.TournamentStubMethods, region: Region, key: APIKey, handler: @escaping ([TournamentEvent]?, String?) -> Void) {
        let completion: (TournamentEventList?, String?) -> Void = { (eventList, error) in
            handler(eventList?.eventList ?? nil, error)
        }
        manageTournament(method: method, region: region, key: key, handler: completion)
    }
    
    public static func manageTournament<RiotModel: Decodable>(method: TournamentStubMethod.TournamentStubMethods, region: Region, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        let tournamentMethod: TournamentStubMethod = TournamentStubMethod(method: method, region: region)
        let tournamentBusiness: APIBusiness = APIBusiness(key: key, method: tournamentMethod)
        tournamentBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
}
