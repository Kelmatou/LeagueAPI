//
//  RESTRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import UIKit

public class RESTRequester {
    
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
     - parameter handler: allows the user to make actions just after request ended (Data, String)
     */
    public static func request(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: String? = nil, handler: @escaping (Data?, String?) -> Void) {
        if let uri = URL(string: url) {
            var request: URLRequest = URLRequest(url: uri)
            request.httpMethod = method.rawValue
            if let body = body {
                request.httpBody = body.data(using: String.Encoding.utf8)
            }
            if let headers = headers {
                for header in headers {
                    request.addValue(header.value, forHTTPHeaderField: header.key)
                }
            }
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                if let error = error {
                    handler(data, error.localizedDescription)
                }
                else {
                    handler(data, nil)
                }
            }
            task.resume()
        }
        else {
            handler(nil, "Invalid URL")
        }
    }
    
    /**
     Sends an HTTP request and that will receive text
     
     - parameter method: the AccessMethod
     - parameter url: the targeted url
     - parameter headers: a dictionary of header [Value : HttpField]
     - parameter body: the content of the message
     - parameter handler: allows the user to make actions just after request ended (String, String)
     */
    public static func requestText(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: String? = nil, handler: @escaping (String?, String?) -> Void) {
        request(method, url: url, headers: headers, body: body) {
            (data, error) in
            var responseDecoded: String?
            if let data = data, error == nil {
                responseDecoded = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            }
            handler(responseDecoded, error)
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
    public static func requestImage(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: String? = nil, handler: @escaping (UIImage?, String?) -> Void) {
        request(method, url: url, headers: headers, body: body) {
            (data, error) in
            var responseImage: UIImage?
            if let data = data, error == nil {
                responseImage = UIImage(data: data)
            }
            handler(responseImage, error)
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
    public static func requestObject<T: Decodable>(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: String? = nil, asType: T.Type, handler: @escaping (T?, String?) -> Void) {
        request(method, url: url, headers: headers, body: body) {
            (data, error) in
            var responseObject: T?
            if let data = data, error == nil {
                let conversion: (T?, String?) = ObjectMapper.convert(data, into: T.self)
                if let object = conversion.0 {
                    responseObject = object
                }
            }
            handler(responseObject, error)
        }
    }
}
