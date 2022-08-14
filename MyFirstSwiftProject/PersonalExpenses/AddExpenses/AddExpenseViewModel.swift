//
//  AddExpenseViewModel.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import Foundation

class AddExpenseViewModel: ObservableObject {
    @Published var expenseTitle = ""
    @Published var expensePrice = ""
    @Published var expenseType = ExpenseType.personal.rawValue
    
    @Published var errorAlertShown: Bool = false
    @Published var errorAlertMessages: [String] = []
    
    var errorAlertMessage: String {
        get {
            return errorAlertMessages
                .joined(separator: ". ")
                .capitalized
        }
    }
    
    func showErrorAlert() {
        errorAlertShown = true
    }
    
    func hideErrorAlert() {
        errorAlertShown = false
    }
    
    func addErrorAlertMessage(_ message: String) {
        errorAlertMessages.append(message)
    }
    
    func save(personalExpensesViewModel: PersonalExpensesViewModel, onSuccess: () -> Void) {
        errorAlertMessages.removeAll()
        
        let price: Double? = Double(expensePrice)
        
        if price == nil {
            addErrorAlertMessage("Price is incorrect")
        }
        
        if expenseTitle.isEmpty {
            addErrorAlertMessage("Title is empty")
        }
        
        if errorAlertMessages.isEmpty {
            personalExpensesViewModel.addExpense(
                title: expenseTitle,
                price: price!,
                type:  ExpenseType(rawValue: expenseType) ?? ExpenseType.personal
            )
            
            onSuccess()
        } else {
            showErrorAlert()
        }
    }
}
