//
//  DataDragonItemBusiness.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/24/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class DataDragonItemBusiness {
    
    public static func getItems(completion: @escaping ([Item]?, String?) -> Void) {
        DataDragonRequester.instance.getItems() { (itemFile, error) in
            completion(itemFile?.items, error)
        }
    }
    
    public static func getItem(by id: ItemId, completion: @escaping (Item?, String?) -> Void) {
        DataDragonRequester.instance.getItems() { (itemFile, error) in
            completion(itemFile?.items.filter { $0.id == id }.first, error)
        }
    }
}
