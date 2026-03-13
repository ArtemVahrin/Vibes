//
//  CardOfDayModel.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import Foundation

struct CardOfDay { //FIXME: Add identifable
    var emotion: Emotion
    var date: Date
    var noteText: String
    var doings: [Doing]
}

extension CardOfDay: Hashable { }
