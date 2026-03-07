//
//  WelcomeScreenView.swift
//  Vibes
//
//  Created by Артём on 07.03.2026.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        ZStack {
            Color(.main)
                .ignoresSafeArea()
            
            TabView() {
                FirstScreenView()
                
                SecondScreenView()
                
                ThirdScreenView()
            }
            .tabViewStyle(.page)
        }
    }
}

#Preview {
    WelcomeScreenView()
}
