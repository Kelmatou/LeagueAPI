//
//  ObjectMapper.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

internal class ObjectMapper {
    
    /**
     Convert data into an object of type T, if T is Decodable
     
     - parameter data: the data to convert
     - parameter type: the destination type
     
     - returns: a couple (T?, String?) where T is the result object if conversion succeed and Error is the error if available
     */
    internal static func convert<T: Decodable>(_ data: Data?, into type: T.Type) -> (T?, String?) {
        if let data = data {
            do {
                let dataJson: T = try JSONDecoder().decode(T.self, from: data)
                return (dataJson, nil)
            }
            catch {
                let error: String = "Could not parse \(type) data from json"
                return (nil, error)
            }
        }
        else {
            return (nil, nil)
        }
    }
    
    internal static func encode<T: Encodable>(_ object: T?) -> Data? {
        guard let object = object else { return nil }
        do {
            return try JSONEncoder().encode(object)
        }
        catch {
            Logger.error("Failed to encode an object")
            return nil
        }
    }
}
