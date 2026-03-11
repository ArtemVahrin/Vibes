//
//  TrackingTypes.swift
//  Vibes
//
//  Created by Артём on 08.03.2026.
//

import Foundation

enum TrackingType: CaseIterable {
    case emotions
    case sleep
    case health
    case hobby
}

extension TrackingType {
    var title: String {
        switch self {
        case .emotions:
            "Emotions"
        case .sleep:
            "Sleep"
        case .health:
            "Health"
        case .hobby:
            "Hobby"
        }
    }
    
    var examples: [String] {
        switch self {
        case .emotions:
            ["calm", "safe", "tired", "bored"]
        case .sleep:
            ["good sleep", "bad sleep"]
        case .health:
            ["sports", "bad feeling", "good felling"]
        case .hobby:
            ["mowies", "reading", "games", "chilling"]
        }
    }
    
    var imageName: String {
        switch self {
        case .emotions:
            "face.smiling.inverse"
        case .sleep:
            "moon.stars"
        case .health:
            "cross.case.fill"
        case .hobby:
            "book"
        }
    }
}

extension TrackingType: Identifiable {
    var id: Int {
        switch self {
        case .emotions: 1
        case .sleep: 2
        case .health: 3
        case .hobby: 4
        }
    }
}
