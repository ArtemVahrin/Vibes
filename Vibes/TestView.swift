//
//  DayCardCellView.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import SwiftUI
import SwiftData

struct DayCardCellView1: View {
    var card: CardOfDay
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: ViewConstants.cornerRadius)
                .foregroundStyle(.main)
            
            VStack(alignment: .leading, spacing: 8) {
                // Верхняя часть с эмоцией и датой
                HStack {
                    Text(card.emotion.emoji)
                        .font(.largeTitle)
                    
                    VStack(alignment: .leading) {
                        Text(card.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                        
                        Text(card.emotion.rawValue)
                            .font(.headline)
                    }
                    
                    Spacer()
                }
                
                // Заметка (если есть)
                if !card.noteText.isEmpty {
                    Text(card.noteText)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                
                // Горизонтальный список занятий
                if !card.doings.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(card.doings, id: \.self) { doing in
                                doingCell(doing)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private func doingCell(_ doing: Doing) -> some View {
        HStack(spacing: 4) {
            Image(systemName: doing.imageName)
                .frame(width: 20, height: 20)
            
            Text(doing.title)
                .font(.caption)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

#Preview {
    DayCardCellView1(card: CardOfDay(
        emotion: Emotion.super,
        date: Date(),
        noteText: "Sample note",
        doings: Doing.allBuiltins
    ))
}
