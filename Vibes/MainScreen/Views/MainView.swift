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

    @Query(sort: \CardOfDay.date) var cards: [CardOfDay]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List {
            ForEach(cards) { card in
                DayCardCellView(card: card)
                    .contextMenu {
                        Text("\(card.doings.count)") //FIXME: show all chosen doings in context menu
                    }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    context.delete(cards[index])
                }
            }
        }
        .interactiveDismissDisabled()
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    let newCard = CardOfDay(emotion: .good, date: .now)
                    AddCardOfDayView(cardOfDay: newCard)
                } label: {
                    Image(systemName: "plus")
                }
            }
        })
    }
    
}

//#Preview {
//    @Previewable @State var navigationPath = [AppScreen]()
//    MainView(navigationPath: $navigationPath)
//        .modelContainer(for: CardOfDay.self, inMemory: true)
//}
