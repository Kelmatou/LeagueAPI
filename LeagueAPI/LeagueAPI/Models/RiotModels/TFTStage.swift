//
//  TFTStage.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

public class TFTStage {
    
    public var totalRound: Int
    
    public var stage: Int {
        let roundsFirstStage: Int = 4
        if self.totalRound <= roundsFirstStage {
            return 1
        } else {
            let roundsPerStage: Int = 7
            let roundsWithoutStage1: Int = self.totalRound - roundsFirstStage
            return 2 + (roundsWithoutStage1 - 1) / roundsPerStage
        }
    }
    
    public var stageRound: Int {
        let roundsFirstStage: Int = 4
        if self.totalRound <= roundsFirstStage {
            return self.totalRound
        } else {
            let roundsPerStage: Int = 7
            let roundsWithoutStage1: Int = self.totalRound - roundsFirstStage
            return ((roundsWithoutStage1 - 1) % roundsPerStage) + 1
        }
    }
    
    public init(_ totalRound: Int) {
        self.totalRound = totalRound
    }
}
