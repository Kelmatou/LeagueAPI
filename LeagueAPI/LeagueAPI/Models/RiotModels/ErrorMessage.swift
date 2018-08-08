//
//  ErrorMessage.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/8/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ErrorMessage: Decodable {
    
    public var message: String
    public var statusCode: Int
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case statusCode = "status_code"
    }
    
    public init(message: String, statusCode: Int) {
        self.message = message
        self.statusCode = statusCode
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.statusCode = try container.decode(Int.self, forKey: .statusCode)
    }
}
