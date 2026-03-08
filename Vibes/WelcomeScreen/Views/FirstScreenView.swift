//
//  FirstScreenView.swift
//  Vibes
//
//  Created by Артём on 07.03.2026.
//

import SwiftUI

struct FirstScreenView: View {
    @State var name = "" //FIXME: add name to userDefaults
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.back.ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Spacer()
                    
                    entryMessage
                    
                    enterNameField
                    
                    Spacer()
                    
                    nextScreenButton
                }
                .padding()
            }
        }
    }
    
    var entryMessage: some View {
        Text("Welcome! \n What`s you name?")
            .font(.largeTitle)
            .foregroundStyle(.font)
            .multilineTextAlignment(.center)
    }
    
    var enterNameField: some View {
        TextField("Your name", text: $name)
            .padding()
            .frame(height: 50)
            .background(RoundedRectangle(cornerRadius: 20).fill(.font))
        
    }
    
    var nextScreenButton: some View {
        NavigationLink {
            SecondScreenView(name: name)
        } label: {
            HStack {
                Text("Let`s start")
                
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(.font)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(.main))
        }
    }
}

#Preview {
    FirstScreenView()
}
