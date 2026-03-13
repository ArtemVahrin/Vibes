//
//  Emotions.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import Foundation

enum Emotion: String {
    case `super` = "super"
    case good = "good"
    case mid = "mid"
    case bad = "bad"
    case awful = "awful"
    
    var emoji: String {
        switch self {
        case .super:
            "😁"
        case .good:
            "🙂"
        case .mid:
            "😐"
        case .bad:
            "☹️"
        case .awful:
            "😖"
        }
    }
    
    var colorName: String {
        switch self {
        case .super: "Super"
        case .good: "Good"
        case .mid: "Mid"
        case .bad: "Bad"
        case .awful: "Awful"
        }
    }
}

extension Emotion: Hashable { }

extension Emotion: Codable { }
