//
//  ItemShop.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ItemShop: Decodable {
    
    public var baseCost: Int
    public var totalCost: Int
    public var sellPrice: Int
    public var purchasable: Bool
    
    enum CodingKeys: String, CodingKey {
        case baseCost = "base"
        case totalCost = "total"
        case sellPrice = "sell"
        case purchasable = "purchasable"
    }
    
    public init(baseCost: Int, totalCost: Int, sellPrice: Int, purchasable: Bool) {
        self.baseCost = baseCost
        self.totalCost = totalCost
        self.sellPrice = sellPrice
        self.purchasable = purchasable
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.baseCost = try container.decode(Int.self, forKey: .baseCost)
        self.totalCost = try container.decode(Int.self, forKey: .totalCost)
        self.sellPrice = try container.decode(Int.self, forKey: .sellPrice)
        self.purchasable = try container.decode(Bool.self, forKey: .purchasable)
    }
}
