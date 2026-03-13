//
//  MainVIew.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import SwiftUI

struct MainView: View {
    @Binding var navigationPath: [AppScreen] //FIXME: hide back button and clear navPath array
    
    var cardsOfDays: [CardOfDay] = [CardOfDay(emotion: Emotion.super, date: .now, noteText: "qweewq", doings: Doing.builtins),
                                    CardOfDay(emotion: Emotion.bad, date: Date(), noteText: "pppp", doings: [
        Doing(title: "family", imageName: "circle"),
        Doing(title: "sport", imageName: "microphone"),
        Doing(title: "family", imageName: "circle"),
        Doing(title: "sport", imageName: "microphone"),
        Doing(title: "family", imageName: "circle"),
        Doing(title: "sport", imageName: "microphone")])]
    
    var body: some View {
        List {
            ForEach(cardsOfDays, id: \.self) { card in
                DayCardCellView(card: card)
            }
        }
    }
}

#Preview {
    @Previewable @State var navigationPath = [AppScreen]()
    MainView(navigationPath: $navigationPath)
}
