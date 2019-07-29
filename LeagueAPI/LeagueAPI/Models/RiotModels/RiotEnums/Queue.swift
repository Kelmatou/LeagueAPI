//
//  Queue.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Queue {
    
    public enum QueueTypes: String {
        case RankedSolo5V5 = "RANKED_SOLO_5x5"
        case RankedFlex5V5 = "RANKED_FLEX_SR"
        case RankedFlex3V3 = "RANKED_FLEX_TT"
        case RankedTFT = "RANKED_TFT"
        case Unknown = "Unknown"
    }
    
    public private(set) var type: QueueTypes
    
    public init?(_ queueType: QueueTypes) {
        guard queueType != .Unknown else {
            Logger.error("QueueType instance cannot be created with \"Unknown\" value")
            return nil
        }
        self.type = queueType
    }
    
    internal init(_ queueType: String) {
        switch queueType {
        case QueueTypes.RankedSolo5V5.rawValue:
            self.type = .RankedSolo5V5
        case QueueTypes.RankedFlex5V5.rawValue:
            self.type = .RankedFlex5V5
        case QueueTypes.RankedFlex3V3.rawValue:
            self.type = .RankedFlex3V3
        case QueueTypes.RankedTFT.rawValue:
            self.type = .RankedTFT
        default:
            Logger.warning("Queue type \"\(queueType)\" unknown (check for LeagueAPI update)")
            self.type = .Unknown
        }
    }
}
