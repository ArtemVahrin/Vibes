//
//  VibesApp.swift
//  Vibes
//
//  Created by Артём on 07.03.2026.
//

import SwiftUI
import SwiftData

@main
struct VibesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CardOfDay.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error.localizedDescription)\n\(error)")
        }
    }()
    
    @AppStorage("HasSeenOnboarding") private var hasSeenOnboarding = false
    
    @State private var navigationPath = [AppScreen]()

//    static private var cardStorage = CardOfDayStorage()
//    @State private var viewModel = ViewModel(cardOfDaysStorage: cardStorage)
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationPath) {
                Group {
                    if hasSeenOnboarding {
                        MainView(navigationPath: $navigationPath)
                    } else {
                        FirstScreenView(name: "", navigationPath: $navigationPath)
                    }
                }
                .navigationDestination(for: AppScreen.self) { screen in
                    switch screen {
                    case .firstScreen:
                        FirstScreenView(name: "", navigationPath: $navigationPath)
                    case .secondScreen(let name):
                        SecondScreenView(name: name, navigationPath: $navigationPath)
                    case .chooseTrackings:
                        ChooseTrackingTypes(selectedTracks: [], navigationPath: $navigationPath)
                    case .mainScreen:
                        MainView(navigationPath: $navigationPath)
                            .onAppear {
                                hasSeenOnboarding = true
                            }
                    }
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
