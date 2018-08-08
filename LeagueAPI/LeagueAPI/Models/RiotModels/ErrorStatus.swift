//
//  ErrorStatus.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/9/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ErrorStatus: Decodable {
    
    public var status: ErrorMessage
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
    }
    
    public init(status: ErrorMessage) {
        self.status = status
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(ErrorMessage.self, forKey: .status)
    }
}
