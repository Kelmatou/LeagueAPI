//
//  MatchEvent.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MatchEvent: Decodable {
    
    public var type: String
    public var eventType: String?
    public var participantId: Int?
    public var teamId: Int?
    public var killerId: Int?
    public var victimId: Int?
    public var assistingParticipantIds: [Int]?
    public var beforeId: Int?
    public var afterId: Int?
    public var position: MatchPosition?
    public var itemId: ItemId?
    public var creatorId: Int?
    public var skillSlot: Int?
    public var pointCaptured: String?
    public var towerType: String?
    public var ascendedType: String?
    public var levelUpType: String?
    public var wardType: String?
    public var monsterType: String?
    public var monsterSubType: String?
    public var laneType: String?
    public var buildingType: String?
    public var timestamp: Datetime
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case eventType = "eventType"
        case participantId = "participantId"
        case teamId = "teamId"
        case killerId = "killerId"
        case victimId = "victimId"
        case assistingParticipantIds = "assistingParticipantIds"
        case beforeId = "beforeId"
        case afterId = "afterId"
        case position = "position"
        case itemId = "itemId"
        case creatorId = "creatorId"
        case skillSlot = "skillSlot"
        case pointCaptured = "pointCaptured"
        case towerType = "towerType"
        case ascendedType = "ascendedType"
        case levelUpType = "levelUpType"
        case wardType = "wardType"
        case monsterType = "monsterType"
        case monsterSubType = "monsterSubType"
        case laneType = "laneType"
        case buildingType = "buildingType"
        case timestamp = "timestamp"
    }
    
    public init(type: String, eventType: String?, participantId: Int?, teamId: Int?, killerId: Int?, victimId: Int?, assistingParticipantIds: [Int]?, beforeId: Int?, afterId: Int?, position: MatchPosition?, itemId: ItemId?, creatorId: Int?, skillSlot: Int?, pointCaptured: String?, towerType: String?, ascendedType: String?, levelUpType: String?, wardType: String?, monsterType: String?, monsterSubType: String?, laneType: String?, buildingType: String?, timestamp: Datetime) {
        self.type = type
        self.eventType = eventType
        self.participantId = participantId
        self.teamId = teamId
        self.killerId = killerId
        self.victimId = victimId
        self.assistingParticipantIds = assistingParticipantIds
        self.beforeId = beforeId
        self.afterId = afterId
        self.position = position
        self.itemId = itemId
        self.creatorId = creatorId
        self.skillSlot = skillSlot
        self.pointCaptured = pointCaptured
        self.towerType = towerType
        self.ascendedType = ascendedType
        self.levelUpType = levelUpType
        self.wardType = wardType
        self.monsterType = monsterType
        self.monsterSubType = monsterSubType
        self.laneType = laneType
        self.buildingType = buildingType
        self.timestamp = timestamp
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.eventType = try? container.decode(String.self, forKey: .eventType)
        self.participantId = try? container.decode(Int.self, forKey: .participantId)
        self.teamId = try? container.decode(Int.self, forKey: .teamId)
        self.killerId = try? container.decode(Int.self, forKey: .killerId)
        self.victimId = try? container.decode(Int.self, forKey: .victimId)
        self.assistingParticipantIds = try? container.decode([Int].self, forKey: .assistingParticipantIds)
        self.beforeId = try? container.decode(Int.self, forKey: .beforeId)
        self.afterId = try? container.decode(Int.self, forKey: .afterId)
        self.position = try? container.decode(MatchPosition.self, forKey: .position)
        self.itemId = try? ItemId(container.decode(Int.self, forKey: .itemId))
        self.creatorId = try? container.decode(Int.self, forKey: .creatorId)
        self.skillSlot = try? container.decode(Int.self, forKey: .skillSlot)
        self.pointCaptured = try? container.decode(String.self, forKey: .pointCaptured)
        self.towerType = try? container.decode(String.self, forKey: .towerType)
        self.ascendedType = try? container.decode(String.self, forKey: .ascendedType)
        self.levelUpType = try? container.decode(String.self, forKey: .levelUpType)
        self.wardType = try? container.decode(String.self, forKey: .wardType)
        self.monsterType = try? container.decode(String.self, forKey: .monsterType)
        self.monsterSubType = try? container.decode(String.self, forKey: .monsterSubType)
        self.laneType = try? container.decode(String.self, forKey: .laneType)
        self.buildingType = try? container.decode(String.self, forKey: .buildingType)
        let timestampLong: Long = try container.decode(Long.self, forKey: .timestamp)
        self.timestamp = Datetime(timestamp: timestampLong)
    }
}
