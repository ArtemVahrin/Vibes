//
//  FirstScreenView.swift
//  Vibes
//
//  Created by Артём on 07.03.2026.
//

import SwiftUI

struct FirstScreenView: View {
    @State var name = "" //FIXME: add name to userDefaults
    @Binding var navigationPath: [AppScreen]
    
    var body: some View {
        ZStack {
            Color.back.ignoresSafeArea()
            
            VStack(alignment: .center) {
                Spacer()
                
                entryMessage
                
                enterNameField
                
                Spacer()
                
                nextScreenButton
                //                    .onTapGesture {
                //                        SettingsStorage.shared.save(name: name)
                //                    }
            }
            .padding()
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
            .background(RoundedRectangle(cornerRadius: ViewConstants.cornerRadius).fill(.font))
        
    }
    
    var nextScreenButton: some View {
        Button {
            navigationPath.append(.secondScreen(name: name))
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

//#Preview {
//    FirstScreenView(, navigationPath: <#Binding<[AppScreen]>#>)
//}
