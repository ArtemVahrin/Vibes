////
////  TestFile.swift
////  Vibes
////
////  Created by Артём on 07.03.2026.
////
//
//import SwiftUI
//
//struct ContentView1: View {
//    let colors: [Color] = [.red, .green, .blue]
//
//    var body: some View {
//        ScrollViewReader { value in
//            Button("Jump to #8") {
//                value.scrollTo(2, anchor: .top)
//            }
//            .padding()
//
//            ScrollView(.horizontal) {
//                HStack {
//                    ForEach(0..<3) { i in
//                        FirstScreenView(, navigationPath: <#Binding<[AppScreen]>#>)
//                            .frame(width: 400, height: 400)
//                            .id(i)
//                    }
//                }
//            }
//            
////            .disabled(true)
//        }
//        .frame(height: 350)
//    }
//    
//}
//
//#Preview {
//    ContentView1()
//}
