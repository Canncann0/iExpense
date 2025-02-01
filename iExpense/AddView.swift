//
//  AddView.swift
//  iExpense
//
//  Created by Cancan on 1.02.2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var name = ""
    @State var type = "Personal"
    @State var amount = 0.0
    
    let types = ["Personal","Business"]
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField(text: $name) {
                    Text("Name")
                }
                
                Picker(selection: $type) {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                } label: {
                    Text("Type")
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)

            }
            .navigationTitle("Add new expense")
            .toolbar{
                Button(action: {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }, label: {
                    Text("Save")
                })
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
