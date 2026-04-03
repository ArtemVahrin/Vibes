//
//  DayCardCellView.swift
//  Vibes
//
//  Created by Артём on 11.03.2026.
//

import SwiftUI
import MooCal
import SwiftData

struct CalendarView: View {
    var viewModel = ScrollableCalendarViewViewModel()
    
    @Query(sort: \CardOfDay.date) var cards: [CardOfDay] = [CardOfDay(emotion: .good, date: .now)]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ScrollableCalendarView(
            viewModel: viewModel,
            calendarDayView: .custom({ calendarDay in
                customCalendarDayView(calendarDay)
            }))
    }
    
    private func customCalendarDayView(_ calendarDay: CalendarDay) -> some View {
        //        let isToday = calendarDay.date.isToday
        let card = cards.first(where: { $0.date.startOfDay == calendarDay.date.startOfDay})
        return calendarCell(of: calendarDay, with: card?.emotion)
    }
    
    private func calendarCell(of day: CalendarDay, with emotion: Emotion?) -> some View {
        return VStack {
            Circle()
                .overlay {
                    if let emotion = emotion {
                        emotionLabel(with: emotion.emoji)
                    } else {
                        addButton(at: day)
                    }
                }
                .foregroundStyle(.main)
            
            Text("\(day.descriptor)")
        }
        .padding(2)
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private func emotionLabel(with emoji: String) -> some View {
        Text(emoji) // add a OnTapGesture which will show all doings at this day
            .font(.system(size: 100))
            .minimumScaleFactor(0.1)
            .aspectRatio(contentMode: .fill)
    }
    
    private func addButton(at day: CalendarDay) -> some View {
        NavigationLink {
            let newCard = CardOfDay(emotion: .good, date: day.date)
            AddCardOfDayView(cardOfDay: newCard)
        } label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
        }
    }
    
}

#Preview {
    CalendarView()
}
