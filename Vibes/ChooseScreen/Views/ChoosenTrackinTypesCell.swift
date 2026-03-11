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
            HStack(spacing: 15) {
                Image(systemName: trackingType.imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text(trackingType.title)
                        .font(Font.system(size: 24))
                        .bold()
                    
                    Text(trackingType.examples.joined(separator: ", "))
                        .multilineTextAlignment(.trailing)
                        .lineLimit(1)
                }
                
                Spacer()
            }
        }
    }

#Preview {
    ChoosenTrackinTypesCell(trackingType: .emotions)
}
