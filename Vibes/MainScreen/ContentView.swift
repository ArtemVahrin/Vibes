//
//  ContentView.swift
//  Vibes
//
//  Created by Артём on 01.04.2026.
//

import SwiftUI

struct ContentView: View {
    @Binding var navigationPath: [AppScreen]
    
    var body: some View {
        TabView {
            Tab("Main", systemImage: "plus") {
                MainView()
            }
            
            Tab("Calendar", systemImage: "calendar") {
                CalendarView()
            }
        }
        .tint(.main) //FIXME: chose another opacity
    }
}
#Preview {
    @Previewable @State var navigationPath = [AppScreen]()
    ContentView(navigationPath: $navigationPath)
}
