//
//  DataDragonProfileIconBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DataDragonProfileIconBusiness {
    
    public static func getProfileIcon(byId id: ProfileIconId, completion: @escaping (ProfileIcon?, String?) -> Void) {
        DataDragonRequester.instance.getProfileIcon(profileIconId: id, completion: completion)
    }
}
