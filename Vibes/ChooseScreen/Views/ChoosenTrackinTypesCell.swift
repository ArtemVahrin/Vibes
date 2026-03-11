//
//  ChoosenTrackinTypesCell.swift
//  Vibes
//
//  Created by Артём on 08.03.2026.
//

import SwiftUI

struct ChoosenTrackinTypesCell: View {
    let trackingType: TrackingType
    
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(trackingType.title)
                        .bold()
                    
                    Text(trackingType.examples.joined(separator: ", "))
                        .multilineTextAlignment(.trailing)
                        .lineLimit(1)
                }
                
                Spacer()
                
//                Image(systemName:  ? "circle.fill" : "circle")
            }
        }
    }

#Preview {
    ChoosenTrackinTypesCell(trackingType: .emotions)
}
