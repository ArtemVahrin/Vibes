//
//  ChooseTrackingTypes.swift
//  Vibes
//
//  Created by Артём on 08.03.2026.
//

import SwiftUI

struct ChooseTrackingTypes: View {
    @State var selectedTracks: Set<TrackingType> = [] //FIXME: Create some ViewModel to store a selected Tracks
    
    var body: some View {
        ZStack {
            Color.back.ignoresSafeArea()
            VStack {
                chooseTrackingTitle
                
                chooseTrackingDescription
                
                chooseButtons
                
                nextScreenButton
                    
            }
            .padding()
        }
    }
    
    private var chooseTrackingTitle: some View {
        Text("What do you want to track?")
            .font(.largeTitle)
            .foregroundStyle(.font)
            .multilineTextAlignment(.center)
    }
    
    private var chooseTrackingDescription: some View {
        Text("Give your entries meaning by choosing the activities you engage in.")
            .foregroundStyle(.font)
            .padding()
    }
    
    private var chooseButtons: some View {
        List(TrackingType.allCases) { trackType in
            Button {
                if selectedTracks.contains(trackType) {
                    selectedTracks.remove(trackType)
                } else {
                    selectedTracks.insert(trackType)
                }
                print(selectedTracks.count)
            } label: {
                HStack {
                    ChoosenTrackinTypesCell(trackingType: trackType)
                        .foregroundStyle(Color.main)
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.main, lineWidth: 2)
                        .fill(selectedTracks.contains(trackType) ? .main : .clear)

                        .frame(width: 30, height: 30)
                }
            }
            .padding()
        }
        .scrollContentBackground(.hidden)
    }
    
    var nextScreenButton: some View {
        NavigationLink {
           
        } label: {
            HStack {
                Text("Next")
                
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(.font)
            .padding()
            .background(RoundedRectangle(cornerRadius: ViewConstants.cornerRadius).fill(.main))
        }
    }
}

#Preview {
    ChooseTrackingTypes()
}
