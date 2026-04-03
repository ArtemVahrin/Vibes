//
//  AppRoutes.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import Foundation

enum AppScreen {
    case firstScreen
    case secondScreen(name: String)
    case chooseTrackings
    case contentView
}

extension AppScreen: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .firstScreen:
            hasher.combine(0)
        case .secondScreen(let name):
            hasher.combine(1)
            hasher.combine(name)
        case .chooseTrackings:
            hasher.combine(2)
        case .contentView:
            hasher.combine(3)
        }
    }
}
