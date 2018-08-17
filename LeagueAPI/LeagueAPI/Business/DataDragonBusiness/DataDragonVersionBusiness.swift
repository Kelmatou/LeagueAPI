//
//  DataDragonVersionBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DataDragonVersionBusiness {
    
    public static func getPatchVersion(completion: @escaping (String?, String?) -> Void) {
        DataDragonRequester.instance.getDataVersions() { (versions, error) in
            completion(versions?.patch, error)
        }
    }
}
