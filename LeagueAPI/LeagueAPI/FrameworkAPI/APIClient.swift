//
//  APIClient.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class APIClient {
    
    internal var key: APIKey
    
    internal init(apiKey: APIKey) {
        self.key = apiKey
    }
}
