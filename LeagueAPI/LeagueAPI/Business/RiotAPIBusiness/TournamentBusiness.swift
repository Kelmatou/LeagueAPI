//
//  TournamentBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class TournamentBusiness {
    
    public static func getTournamentEvents(method: TournamentMethod.TournamentMethods, key: APIKey, handler: @escaping ([TournamentEvent]?, String?) -> Void) {
        let completion: (TournamentEventList?, String?) -> Void = { (eventList, error) in
            handler(eventList?.eventList ?? nil, error)
        }
        manageTournament(method: method, key: key, handler: completion)
    }
    
    public static func manageTournament<RiotModel: Decodable>(method: TournamentMethod.TournamentMethods, key: APIKey, handler: @escaping (RiotModel?, String?) -> Void) {
        checkCodeAmountParameter(method: method)
        let tournamentMethod: TournamentMethod = TournamentMethod(method: method)
        let tournamentBusiness: APIBusiness = APIBusiness(key: key, method: tournamentMethod)
        tournamentBusiness.request() { (result, error) in
            handler(result, error)
        }
    }
    
    private static func checkCodeAmountParameter(method: TournamentMethod.TournamentMethods) {
        switch method {
        case .UpdateTournamentInfo, .GetTournamentInfo, .EventsByTournamentCode, .CreateProvider, .CreateTournament:
            return
        case .CreateCodes(let amount, _, _):
            if let amount = amount {
                if amount < 1 || amount > 1000 {
                    Logger.warning("createTournamentCode amount parameter must be between 1 and 1000. Here amount=\(amount) and it will result in 400 (Bad Request)")
                }
            }
        }
    }
}
