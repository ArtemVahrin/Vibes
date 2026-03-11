//
//  SecondScreenView.swift
//  Vibes
//
//  Created by Артём on 08.03.2026.
//

import SwiftUI

struct SecondScreenView: View {
    var name: String
    
    var body: some View {
        ZStack {
            Color.back.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                gladTitle
                
                gladMessage
                
                Spacer()
                
                nextScreenButton
            }
            .foregroundStyle(.font)
            .padding()
        }
    }
    
    private var gladTitle: some View {
        Text("We are glad that you are with us, \(name)")
            .font(.largeTitle)
    }
    
    private var gladMessage: some View {
        Text("We'll help you capture moods and events with emojis—without words. Discover patterns, explore your feelings, and cherish every moment, big or small.")
            .foregroundStyle(.font)
            .padding()
    }
    
    private var nextScreenButton: some View {
        NavigationLink {
            ChooseTrackingTypes()
        } label: {
            HStack {
                Text("Let`s start")
                
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(.font)
            .padding()
            .background(RoundedRectangle(cornerRadius: ViewConstants.cornerRadius).fill(.main))
        }
    }
    
}

#Preview {
    SecondScreenView(name: "Pop")
}
