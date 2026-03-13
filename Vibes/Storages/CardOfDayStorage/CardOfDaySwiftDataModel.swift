//
//  CardOfDaySwiftDataModel.swift
//  Vibes
//
//  Created by Артём on 13.03.2026.
//

import Foundation
import SwiftData

@Model
class CardOfDayModel {
    var emotionRawValue: String
    var date: Date
    var noteText: String
    @Attribute(.externalStorage) var doingsData: Data?
    
    var emotion: Emotion {
        get {
            Emotion(rawValue: emotionRawValue) ?? .good
        }
        set {
            emotionRawValue = newValue.rawValue
        }
    }
    
    var doings: [Doing] {
        get {
            do {
                guard let data = doingsData else { return [] }
                return try JSONDecoder().decode([Doing].self, from: data)
            } catch {
                print("Decode error : \(error.localizedDescription)")
                return []
            }
        }
        set {
            doingsData = try? JSONEncoder().encode(newValue)
        }
    }
    
    init(emotion: Emotion, date: Date, noteText: String, doings: [Doing]) {
        self.emotionRawValue = emotion.rawValue
        self.date = date
        self.noteText = noteText
        self.doings = doings
    }
    
    convenience init(cardOfDay: CardOfDay) {
        self.init(emotion: cardOfDay.emotion, date: cardOfDay.date, noteText: cardOfDay.noteText, doings: cardOfDay.doings)
    }
    
    func convert() -> CardOfDay {
        CardOfDay(emotion: emotion, date: date, noteText: noteText, doings: doings)
    }
}
