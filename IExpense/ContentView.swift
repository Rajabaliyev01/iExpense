//
//  ContentView.swift
//  iExpense
//
//  Created by Rajabaliyev01 on 17/04/26.
//
import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isAnimated = false
    @State private var switchPage = false
//    @State private var first = false
    var body: some View {
        ZStack{
            Spacer()
            Color.red.ignoresSafeArea()
            
            VStack {
                HStack {
                                    Spacer() // Tugmani o'ngga suradi
                                    
                                    Button {
                                        dismiss()
                                    } label: {
                                        Image(systemName: "xmark")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(Color.black.opacity(0.3))
                                            .clipShape(Circle())
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.top, 10)
                          

                                Spacer()
                Spacer()
                Image(systemName: "phone.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaleEffect(isAnimated ? 2.0 : 1.0)
                    .animation(.spring(), value: isAnimated)
                Spacer()
                Button("Animatsiyani ko'rish") {
                    isAnimated.toggle()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                
                
            }
        }
        
    }
}
struct ContentView: View {
    @State private var isAnimated = false
    @State private var switchPage = false
    
    var body: some View {
        ZStack{
            Spacer()
            Color.gray.ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(systemName: "swift")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaleEffect(isAnimated ? 2.0 : 1.0) // Hajmni o'zgartirish
                    .animation(.spring(), value: isAnimated)
                Spacer()
                Button("Animatsiyani ko'rish") {
                    isAnimated.toggle()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                Button("switch pages") {
                    switchPage.toggle()
                }
                .sheet(isPresented: $switchPage) {
                    SecondView()
                    
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
        }
    }
}
#Preview {
    ContentView()
}
