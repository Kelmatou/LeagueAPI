//
//  RESTRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import UIKit

public class RESTRequester {
    
    public typealias Headers = [AnyHashable : Any]
    
    public enum AccessMethod: String {
        case GET     = "GET"
        case POST    = "POST"
        case PUT     = "PUT"
        case HEAD    = "HEAD"
        case DELETE  = "DELETE"
        case PATCH   = "PATCH"
        case TRACE   = "TRACE"
        case OPTIONS = "OPTIONS"
        case CONNECT = "CONNECT"
    }
    
    /**
     Sends an HTTP request
     
     - parameter method: the AccessMethod
     - parameter url: the targeted url
     - parameter headers: a dictionary of header [Value : HttpField]
     - parameter body: the content of the message
     - parameter handler: allows the user to make actions just after request ended (Data, Headers, String)
     */
    public static func request(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: Data? = nil, handler: @escaping (Data?, Headers?, String?) -> Void) {
        if let uri = URL(string: url) {
            var request: URLRequest = URLRequest(url: uri)
            request.httpMethod = method.rawValue
            request.httpBody = body
            if let headers = headers {
                for header in headers {
                    request.addValue(header.value, forHTTPHeaderField: header.key)
                }
            }
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                var httpResponse: HTTPURLResponse? = nil
                if let httpResponseUnwrapped = response as? HTTPURLResponse {
                    httpResponse = httpResponseUnwrapped
                }
                let allHeaders: Headers? = httpResponse?.allHeaderFields
                Logger.print("Server responsed with code \(httpResponse?.statusCode ?? 0)")
                if let httpResponse = httpResponse {
                    let validResponseCode: Int = 200
                    if httpResponse.statusCode == validResponseCode {
                        handler(data, allHeaders, nil)
                    }
                    else {
                        let dataConversion: (ErrorStatus?, String?) = ObjectMapper.convert(data, into: ErrorStatus.self)
                        if let errorStatus = dataConversion.0 {
                            handler(nil, allHeaders, errorStatus.status.message)
                        }
                        else {
                            handler(nil, allHeaders, error?.localizedDescription)
                        }
                    }
                }
                else {
                    handler(data, allHeaders, error?.localizedDescription)
                }
            }
            Logger.print("Requesting: \(url)")
            task.resume()
        }
        else {
            handler(nil, nil, "Invalid URL")
        }
    }
    
    /**
     Sends an HTTP request and that will receive an image
     
     - parameter method: the AccessMethod
     - parameter url: the targeted url
     - parameter headers: a dictionary of header [Value : HttpField]
     - parameter body: the content of the message
     - parameter handler: allows the user to make actions just after request ended (UIImage, String)
     */
    public static func requestImage(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: Data? = nil, handler: @escaping (UIImage?, Headers?, String?) -> Void) {
        request(method, url: url, headers: headers, body: body) {
            (data, headers, error) in
            var responseImage: UIImage?
            if let data = data, error == nil {
                responseImage = UIImage(data: data)
            }
            handler(responseImage, headers, error)
        }
    }
    
    /**
     Sends an HTTP request and that will receive an object of type T
     
     - parameter method: the AccessMethod
     - parameter url: the targeted url
     - parameter headers: a dictionary of header [Value : HttpField]
     - parameter body: the content of the message
     - parameter asType: the type of the output object
     - parameter handler: allows the user to make actions just after request ended (UIImage, String)
     */
    public static func requestObject<T: Decodable>(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: Data? = nil, asType: T.Type, handler: @escaping (T?, Headers?, String?) -> Void) {
        request(method, url: url, headers: headers, body: body) {
            (data, headers, error) in
            var responseObject: T?
            var responseError: String? = error
            if let data = data, error == nil {
                let conversion: (T?, String?) = ObjectMapper.convert(data, into: T.self)
                if let object = conversion.0 {
                    responseObject = object
                }
                if let conversionError = conversion.1 {
                    responseError = conversionError
                }
            }
            handler(responseObject, headers, responseError)
        }
    }
}
