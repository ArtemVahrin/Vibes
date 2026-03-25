//
//  Doing.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import Foundation
import SwiftData

@Model
class Doing {
    var title: String
    var imageName: String
    var isChosen = false
    
    var id = UUID()
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

extension Doing {
    static let allBuiltins: [Doing] = [
        Doing(title: "Sport", imageName: "figure.run"),
        Doing(title: "Read", imageName: "book"),
        Doing(title: "Meditate", imageName: "lungs"),
        Doing(title: "Work", imageName: "briefcase"),
        Doing(title: "Study", imageName: "graduationcap"),
        Doing(title: "Walk", imageName: "figure.walk"),
        Doing(title: "Cook", imageName: "fork.knife"),
        Doing(title: "Music", imageName: "music.note"),
        Doing(title: "Friends", imageName: "person.2"),
        Doing(title: "Sleep", imageName: "bed.double")
    ]
    
    static func seedBuilitIns(in context: ModelContext) {
        let fetchDesriptor = FetchDescriptor<Doing>()
        let existingDoings = try? context.fetch(fetchDesriptor)
        
        if existingDoings?.isEmpty ?? true {
            for doing in allBuiltins {
                context.insert(doing)
            }
            try? context.save()
        }
    }
    
   static func clearAllChosen() {
        Doing.allBuiltins.forEach { $0.isChosen = false }
    }
}
