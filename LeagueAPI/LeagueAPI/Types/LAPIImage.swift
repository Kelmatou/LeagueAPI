//
//  LAPIImage.swift
//  LeagueAPI
//
//  Created by Ammon Parry on 8/14/20.
//

import Foundation

#if canImport(UIKit)
import UIKit
public typealias LAPIImage = UIImage
#else
public typealias LAPIImage = LAPIImage_Interal
#endif

public struct LAPIImage_Interal {
    public let data: Data
    
    public init?(data: Data) {
        self.data = data
    }
    
    
}
