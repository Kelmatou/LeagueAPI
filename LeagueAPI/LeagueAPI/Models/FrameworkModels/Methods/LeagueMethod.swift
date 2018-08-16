//
//  LeagueMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal protocol LeagueMethod {
    
    func getAccessMethod() -> RESTRequester.AccessMethod
    func getMethodSignature() -> String
    func getMethodUrl() -> String
    func getMethodBody() -> Data?
    func getWarningMessage() -> String?
}
