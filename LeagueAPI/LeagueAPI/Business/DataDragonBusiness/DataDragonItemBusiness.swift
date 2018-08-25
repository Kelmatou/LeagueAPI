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
        if id == ItemId.NoItemId {
            completion(nil, nil)
        }
        else {
            getItems() { (items, error) in
                if let items = items {
                    items.firstMatch(where: { $0.id == id }, notFoundMessage: "Item with id=\(id) not found.", completion: completion)
                }
                else {
                    completion(nil, error)
                }
            }
        }
    }
    
    public static func getItem(byName name: String, completion: @escaping (Item?, String?) -> Void) {
        getItems() { (items, error) in
            if let items = items {
                items.firstMatch(where: { $0.name.equals(name) }, notFoundMessage: "Item with name=\(name) not found.", completion: completion)
            }
            else {
                completion(nil, error)
            }
        }
    }
    
    public static func getItems(byTag tag: String, completion: @escaping ([Item]?, String?) -> Void) {
        getItems() { (items, error) in
            if let items = items {
                completion(items.filter { $0.tags.contains(where: { $0.equals(tag) }) }, error)
            }
            else {
                completion(nil, error)
            }
        }
    }
}
