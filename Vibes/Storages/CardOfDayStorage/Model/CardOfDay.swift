//
//  CardOfDaySwiftDataModel.swift
//  Vibes
//
//  Created by Артём on 13.03.2026.
//

import Foundation
import SwiftData

@Model
class CardOfDay {
    var id = UUID()
    
    var emotionRawValue: String
    var date: Date
    var noteText: String
    
    @Relationship var doings: [Doing]
    
    var emotion: Emotion {
        get {
            Emotion(rawValue: emotionRawValue) ?? .good
        }
        set {
            emotionRawValue = newValue.rawValue
        }
    }

    init(emotion: Emotion, date: Date, noteText: String = "", doings: [Doing] = []) {
        self.emotionRawValue = emotion.rawValue
        self.date = date
        self.noteText = noteText
        self.doings = doings
    }
}
