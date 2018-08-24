//
//  ItemId.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class ItemId: Identifier<Int> {
    
    public static var NoItemId: ItemId {
        return ItemId(0)
    }
}
