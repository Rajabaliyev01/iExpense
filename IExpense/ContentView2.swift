//
//  ContentView.swift
//  iExpense
//
//  Created by Rajabaliyev01 on 17/04/26.
//
import SwiftUI
struct ContentView2: View {
    @AppStorage("Rows") private var numberRows = 0
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    @State private var string = [String]()
    
    var body: some View {
        NavigationStack {
            NavigationLink("Any types of data") {
                ContentView()
            }
            ZStack {
                LinearGradient(colors: [.blue, .black],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                VStack {
                    List {
                        ForEach($string, id: \.self) { $string in
                            TextField("Data", text: $string)
                                .listRowBackground(Color.white.opacity(0.6))
                        }
                        .onDelete(perform: removeRows)
                        
                    }
                    Button("Add Number : \(numberRows) ") {
                        string.append("\(numberRows + 1)")
                        currentNumber += 1
                        numberRows += 1
                    }
                    Text("\(numberRows) rows")
                    Button("Clear All") {
                        numberRows = 0
                        string.removeAll()
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .toolbar {
                EditButton()
            }
        }
    }
    func removeRows(offsets: IndexSet) {
        string.remove(atOffsets: offsets)
        numberRows -= offsets.count
    }
}

#Preview {
    ContentView2()
}
