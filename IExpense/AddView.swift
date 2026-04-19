//
//  addView.swift
//  iExpense
//
//  Created by Rajabaliyev01 on 19/04/26.
//An expense tracker app built as part of the #100DaysOfSwiftUI challenge by @twostraws (Paul Hudson).

import SwiftUI
import UIKit
struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = ""
    @State private var amount = 0.0
    var expenses: Expenses
    let types = ["Bussiness", "Personal"]
    
   
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Image("earth")
                    .resizable()
                    .ignoresSafeArea()
                
                Form {
                    TextField("Name", text: $name)
                        .listRowBackground(Color.white.opacity(0.5))
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.5))
                    TextField("Amount", value: $amount, format: .currency(code: "UZS"))
                        .keyboardType(.decimalPad)
                        .listRowBackground(Color.white.opacity(0.5))
                }
                .scrollContentBackground(.hidden)
            }
            .onAppear{
                setNavigationFontSize()
            }
            .navigationTitle("Add new Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
    func setNavigationFontSize() {
        let appear = UINavigationBarAppearance()
        appear.configureWithDefaultBackground() // This keeps all default behaviors including blur
        
        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        
        // Only modify the font attributes, everything else stays default
        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = atters
        
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
        UINavigationBar.appearance().scrollEdgeAppearance = appear
    }
}


#Preview {
    AddView(expenses: Expenses())
}
