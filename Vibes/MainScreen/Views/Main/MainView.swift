//
//  MainVIew.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Query(sort: \CardOfDay.date) var cards: [CardOfDay] = [CardOfDay(emotion: .good, date: .now)]
    @Environment(\.modelContext) private var context
    @State private var showingAddView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(cards) { card in
                    DayCardCellView(card: card)
                        .contextMenu {
                            Text("\(card.doings.count)")
                        }
                }
                .onDelete(perform: deleteCards)
            }
            
            addButton
        }
        
    }
    private func deleteCards(at offsets: IndexSet) {
        offsets.forEach { context.delete(cards[$0]) }
    }
    
    private var addButton: some View {
        NavigationLink {
            let newCard = CardOfDay(emotion: .good, date: .now)
            AddCardOfDayView(cardOfDay: newCard)
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(.main)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
        .padding(.trailing, 20)
        .padding(.bottom, 20)
    }
}


