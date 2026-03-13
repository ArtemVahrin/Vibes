//
//  MainVIew.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Binding var navigationPath: [AppScreen] //FIXME: hide back button and clear navPath array
    
    @Environment(\.modelContext) private var modelContext
    @Query private var cardsOfDays: [CardOfDayModel]

    
    var body: some View {
        List {
            ForEach(cardsOfDays, id: \.self) { card in
                DayCardCellView(card: card.convert())
            }
        }
        
//        Button("add") {
//            let newCard = CardOfDay(emotion: .bad, date: Date(), noteText: "NoteTextTest", doings: [Doing(title: "droqwe", imageName: "circle.fill")])
//            modelContext.insert(CardOfDayModel(cardOfDay: newCard))
//        }
    }
}

#Preview {
    @Previewable @State var navigationPath = [AppScreen]()
    MainView(navigationPath: $navigationPath)
        .modelContainer(for: CardOfDayModel.self, inMemory: true)
}
