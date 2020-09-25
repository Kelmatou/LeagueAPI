//
//  RESTRequester.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

#if os(Linux)
import FoundationNetworking
#endif

#if canImport(UIKit)
    import UIKit
#endif

internal class RESTRequester {
    
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
     - parameter handler: allows the user to make actions just after request ended (Data, ResponseCode, Headers, String)
     */
    public func request(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: Data? = nil, handler: @escaping (Data?, HttpResponseCode, Headers?, String?) -> Void) {
        let urlPercentEncoding: String? = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let urlPercentEncoding = urlPercentEncoding, let uri = URL(string: urlPercentEncoding) {
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
                let responseCode: HttpResponseCode = HttpResponseCode(httpResponse?.statusCode ?? -1)
                Logger.debug("Server responsed with code \(responseCode.codeValue) (\(responseCode.errorMessage() ?? "No description"))")
                let errorValue: String? = error?.localizedDescription ?? responseCode.errorMessage()
                handler(data, responseCode, allHeaders, errorValue)
            }
            Logger.debug("Requesting: \(url)")
            task.resume()
        }
        else {
            handler(nil, HttpResponseCode(.FrameworkError), nil, "Invalid URL")
        }
    }
    
    /**
     Sends an HTTP request and that will receive an image
     
     - parameter method: the AccessMethod
     - parameter url: the targeted url
     - parameter headers: a dictionary of header [Value : HttpField]
     - parameter body: the content of the message
     - parameter handler: allows the user to make actions just after request ended (LAPIImage, String)
     */
    public func requestImage(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: Data? = nil, handler: @escaping (LAPIImage?, HttpResponseCode, Headers?, String?) -> Void) {
        request(method, url: url, headers: headers, body: body) {
            (data, responseCode, headers, error) in
            var responseImage: LAPIImage?
            if let data = data, error == nil {
                responseImage = LAPIImage(data: data)
            }
            handler(responseImage, responseCode, headers, error)
        }
    }
    
    /**
     Sends an HTTP request and that will receive an object of type T
     
     - parameter method: the AccessMethod
     - parameter url: the targeted url
     - parameter headers: a dictionary of header [Value : HttpField]
     - parameter body: the content of the message
     - parameter asType: the type of the output object
     - parameter handler: allows the user to make actions just after request ended (LAPIImage, String)
     */
    public func requestObject<T: Decodable>(_ method: AccessMethod, url: String, headers: [String : String]? = nil, body: Data? = nil, asType: T.Type, handler: @escaping (T?, HttpResponseCode, Headers?, String?) -> Void) {
        request(method, url: url, headers: headers, body: body) {
            (data, responseCode, headers, error) in
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
            handler(responseObject, responseCode, headers, responseError)
        }
    }
}
