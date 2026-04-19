//
//  ContentView.swift
//  iExpense
//
//  Created by Rajabaliyev01 on 17/04/26.
//
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
struct ContentView3: View {
    @State private var expenses = Expenses()
    
    @State private var showAddExpense = false
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .black],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                List {
                    ForEach(expenses.items) { item in
                        HStack{
                            VStack(alignment: .leading) {
                                Text("\(item.name)")
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: "uzs"))
                            //                                    Text("\(item.name)\n\(item.amount.formatted(.number.precision(.fractionLength(0)))) so'm\n\(item.type)")
                            
                        }
                        .listRowBackground(Color.white.opacity(0.5))
                    }
                    .onDelete(perform: removeItem)
                }
                .navigationTitle("iExpenses")
                .toolbar {
                    Button("Add Expense", systemImage: "plus") {
                        showAddExpense = true
                        
                    }
                    .buttonStyle(.glassProminent)
                }
                .sheet(isPresented: $showAddExpense) {
                    AddView(expenses: expenses)
                    
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
    func removeItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}
#Preview {
    ContentView3()
}
