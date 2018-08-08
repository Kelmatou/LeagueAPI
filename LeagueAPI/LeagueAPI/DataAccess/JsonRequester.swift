//
//  JsonRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/2/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class JsonRequester: DataRequester {
    
    public func request<DataType: Decodable>(accessMethod: RESTRequester.AccessMethod, methodUrl: String, headers: [String : String], body: Data?, handler: @escaping (DataType?, RESTRequester.Headers?, String?) -> Void) {
        RESTRequester.requestObject(accessMethod, url: methodUrl, headers: headers, body: body, asType: DataType.self) { (result, headers, error) in
            handler(result, headers, error)
        }
    }
}
