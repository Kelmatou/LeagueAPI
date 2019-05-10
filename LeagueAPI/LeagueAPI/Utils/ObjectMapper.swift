//
//  ObjectMapper.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ObjectMapper {
    
    /**
     Convert data into an object of type T, if T is Decodable
     
     - parameter data: the data to convert
     - parameter type: the destination type
     
     - returns: a couple (T?, String?) where T is the result object if conversion succeed and Error is the error if available
     */
    internal static func convert<T: Decodable>(_ data: Data?, into type: T.Type) -> (T?, String?) {
        if let data = data {
            var errorReason: String?
            do {
                let dataJson: T = try JSONDecoder().decode(T.self, from: data)
                return (dataJson, nil)
            }
            catch DecodingError.keyNotFound(let key, let context) {
                let keyPath: String = getJsonPath(from: context.codingPath)
                errorReason = "key \"\(key.stringValue)\" was not found in \(keyPath)"
            }
            catch DecodingError.valueNotFound(let valueType, let context) {
                let keyPath: String = getJsonPath(from: context.codingPath)
                errorReason = "A \(valueType) was expected for key \"\(context.codingPath.last?.stringValue ?? "(no key)")\", but no value was associated. Full path: \(keyPath)"
            }
            catch DecodingError.typeMismatch(let typeExcepted, let context) {
                let keyPath: String = getJsonPath(from: context.codingPath)
                errorReason = "A \(typeExcepted) was expected for key \"\(context.codingPath.last?.stringValue ?? "(no key)")\". Full path \(keyPath)"
            }
            catch DecodingError.dataCorrupted(let context) {
                let keyPath: String = getJsonPath(from: context.codingPath)
                errorReason = "\(context.debugDescription) for path \(keyPath)"
            }
            catch {
            }
            return (nil, "Could not parse \(type) data from json \(errorReason == nil ? "" : "because \(errorReason!)")")
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
    
    private static func getJsonPath(from keys: [CodingKey]) -> String {
        var result: String = ""
        for key in keys {
            if !result.isEmpty {
                result += "->"
            }
            result += key.stringValue
        }
        return result
    }
}
