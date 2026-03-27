//
//  AddCardOfDayView.swift
//  Vibes
//
//  Created by Артём on 14.03.2026.
//

import SwiftUI
import SwiftData

struct AddCardOfDayView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var cardOfDay: CardOfDay

    var body: some View {
        Form {
            Section("How do You feel?") {
                chooseEmotion
            }
            
            Section("Choose date") {
                chooseDate
            }
            
            Section("Choose a doings") {
                chooseDoings
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    saveCardOfDay()
                }
            }
        }
    }
    
    var chooseEmotion: some View {
        HStack {
            ForEach(Emotion.allCases, id: \.self) { emote in
                Text(emote.emoji)
                    .font(.system(size: 40))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: ViewConstants.cornerRadius).fill(emote.emoji == cardOfDay.emotion.emoji ? Color(emote.colorName) : .gray.opacity(0.2))) //FIXME: add animation like in swiftUIAnimationsExample
                
                    .onTapGesture {
                        cardOfDay.emotion = emote
                    }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var chooseDate: some View {
        DatePicker(selection: $cardOfDay.date) {
        }
    }
    
    var chooseDoings: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(Doing.allBuiltins) { doing in
                    doingCell(doing)
                        .onTapGesture {
                            if let index = Doing.allBuiltins.firstIndex(where: { $0.id == doing.id }) {
                                Doing.allBuiltins[index].isChosen.toggle()
                            }
                            
                            save(doing: doing)
                        }
                }
            }
        }
    }
    
    private func doingCell(_ doing: Doing) -> some View {
        VStack {
            Image(systemName: doing.imageName)
            
            Text(doing.title)
        }
        .padding(12)
        .foregroundStyle(.black)
        .background(doing.isChosen ? Color(cardOfDay.emotion.colorName).opacity(0.5) : Color(cardOfDay.emotion.colorName).opacity(0.1)) //FIXME: Add animation
        .clipShape(RoundedRectangle(cornerRadius: ViewConstants.cornerRadius))
    }
    
    private func saveCardOfDay() {
        clearDoingsStatus()
        
        modelContext.insert(cardOfDay)
        try? modelContext.save()
        
        dismiss()
    }
    
    private func save(doing: Doing) {
        if let chosenIndex = cardOfDay.doings.firstIndex(where: { $0.id == doing.id }) {
            cardOfDay.doings.remove(at: chosenIndex)
        } else {
            cardOfDay.doings.append(doing)
        }
    }
    
    private func clearDoingsStatus() {
        Doing.allBuiltins.forEach { $0.isChosen = false }
    }
}

#Preview {
    var card = CardOfDay(emotion: Emotion.awful, date: Date(), noteText: "qwe", doings: [])
    AddCardOfDayView(cardOfDay: card)
}
