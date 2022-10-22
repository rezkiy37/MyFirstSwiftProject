//
//  AddView.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var personalExpensesViewModel: PersonalExpensesViewModel
    @ObservedObject var addExpenseViewModel = AddExpenseViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Expense title", text: $addExpenseViewModel.expenseTitle)
                
                TextField("Price", text: $addExpenseViewModel.expensePrice)
                    .keyboardType(.numberPad)
                
                Picker("Expense type", selection: $addExpenseViewModel.expenseType) {
                    ForEach(ExpenseType.allCases, id: \.self.rawValue) {
                        Text($0.rawValue)
                    }
                }
            }
            .navigationTitle("Add expense")
            .toolbar(content: {
                ToolbarItem(id: "CancelButton", placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(id: "SaveButton", placement: .navigationBarTrailing) {
                    Button("Save") {
                        addExpenseViewModel.save(personalExpensesViewModel: personalExpensesViewModel) {
                            dismiss()
                        }
                    }.alert("Error", isPresented: $addExpenseViewModel.errorAlertShown) {
                        Button("Ok") {
                            addExpenseViewModel.hideErrorAlert()
                        }
                    } message: {
                        Text(addExpenseViewModel.errorAlertMessage)
                    }
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(personalExpensesViewModel: PersonalExpensesViewModel())
    }
}
