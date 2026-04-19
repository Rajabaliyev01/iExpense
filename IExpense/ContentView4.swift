//
//  ContentView.swift
//  iExpense
//
//  Created by Rajabaliyev01 on 17/04/26.
//
import SwiftUI
struct ContentView4: View {
    var body: some View {
        ZStack {
            Image("earth")
                .resizable()
                
                .ignoresSafeArea()
            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                    .bold()
                Text("This is a demo app")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                    .bold()
                    .italic()
                    Spacer()
                Button("BOS"){
                   
                }
               
                .padding()
                .buttonStyle(.glass)
//                .buttonStyle(.bordered)
                
                
            }
            
        }
        
      
    }
}

#Preview {
    ContentView4()
}
