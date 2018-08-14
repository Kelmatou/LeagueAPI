//
//  StatusBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class StatusBusiness {
    
    public static func getStatus(method: StatusMethod.StatusMethods, region: Region, key: APIKey, handler: @escaping (ServiceStatus?, String?) -> Void) {
        let statusMethod: StatusMethod = StatusMethod(method: method, region: region)
        let statusBusiness: APIBusiness = APIBusiness(key: key, method: statusMethod)
        statusBusiness.request() { (status, error) in
            handler(status, error)
        }
    }
}
