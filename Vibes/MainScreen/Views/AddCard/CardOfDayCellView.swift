//
//  DayCardCellView.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import SwiftUI

struct DayCardCellView: View {
    var card: CardOfDay
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: ViewConstants.cornerRadius)
                .foregroundStyle(Color(card.emotion.colorName))
            
            VStack(alignment: .leading, spacing: ViewConstants.paddingSize) {
                info
                
                if !card.noteText.isEmpty {
                    Text(card.noteText)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                
                if !card.doings.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        doings
                    }
                }
            }
            .foregroundStyle(.font)
            .padding()
        }
    }
    private var info: some View {
        HStack {
            Text(card.emotion.emoji)
                .font(.system(size: FontConstants.titleSize))
            
            VStack(alignment: .leading) {
                Text(card.date.formatted(date: .abbreviated, time: .shortened))
                
                Text(card.emotion.rawValue)
                    .font(Font.system(size: FontConstants.subtitleSize))
                    .bold()
            }
            
            Spacer()
        }
    }
    private var doings: some View {
        HStack {
            ForEach(card.doings, id: \.self) { doing in
                doingCell(doing)
            }
        }
    }
    
    private func doingCell(_ doing: Doing) -> some View {
        HStack {
            Image(systemName: doing.imageName)
            
            Text(doing.title)
        }
        .padding(ViewConstants.paddingSize)
        .background(Color.gray.opacity(ViewConstants.backgroundOpacity))
        .clipShape(RoundedRectangle(cornerRadius: ViewConstants.cornerRadius))
    }
}

#Preview {
    DayCardCellView(card: CardOfDay(emotion: Emotion.super, date: Date(), noteText: "", doings: Doing.allBuiltins))
}
