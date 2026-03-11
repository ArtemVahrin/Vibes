//
//  SettingsStorage.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import Foundation

class SettingsStorage {
    static let shared = SettingsStorage()
    
    private init() {
        
    }
    
    func save(name: String) {
        UserDefaults.setValue(name, forKey: "user.name")
    }
    
    func save(tracks: Set<TrackingType>) {
        UserDefaults.setValue(tracks, forKey: "user.tracks")
    }
    
    func getName() -> String {
        UserDefaults.standard.string(forKey: "user.name") ?? ""
    }

}
