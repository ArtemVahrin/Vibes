//
//  Doing.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import Foundation
import SwiftData

struct Doing {
    var title: String
    var imageName: String
}

extension Doing {
    static var builtins: [Doing] = [
        Doing(title: "family", imageName: "circle"),
        Doing(title: "sport", imageName: "microphone")
    ]
}

extension Doing: Hashable { } 

extension Doing: Codable { }
