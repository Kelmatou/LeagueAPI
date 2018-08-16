//
//  DataRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/2/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal protocol DataRequester {
    func request<DataType: Decodable>(accessMethod: RESTRequester.AccessMethod, methodUrl: String, headers: [String: String], body: Data?, handler: @escaping (DataType?, HttpResponseCode, RESTRequester.Headers?, String?) -> Void)
}
