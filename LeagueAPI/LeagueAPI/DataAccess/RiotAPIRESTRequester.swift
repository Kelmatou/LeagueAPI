//
//  RiotAPIRESTRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class RiotAPIRESTRequester: RESTRequester {
    
    override func request(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: Data? = nil, handler: @escaping (Data?, HttpResponseCode, Headers?, String?) -> Void) {
        super.request(method, url: url, headers: headers, body: body) { (data, responseCode, allHeaders, error) in
            if responseCode == .Ok || responseCode == .Unknown {
                handler(data, responseCode, allHeaders, error)
            }
            else if responseCode == .Forbidden && !self.hasAppRateHeaders(headers: headers) {
                handler(nil, responseCode, allHeaders, "API key is invalid or expired")
            }
            else {
                let dataConversion: (ErrorStatus?, String?) = ObjectMapper.convert(data, into: ErrorStatus.self)
                if let errorStatus = dataConversion.0 {
                    handler(nil, responseCode, allHeaders, errorStatus.status.message)
                }
                else {
                    handler(nil, responseCode, allHeaders, error)
                }
            }
        }
    }
    
    private func hasAppRateHeaders(headers: RESTRequester.Headers?) -> Bool {
        return headers != nil && headers!["X-NewRelic-App-Data"] != nil
    }
}
