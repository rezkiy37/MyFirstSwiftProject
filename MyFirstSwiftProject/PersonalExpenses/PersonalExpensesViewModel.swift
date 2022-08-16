//
//  PersonalExpensesViewModel.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import Foundation

class PersonalExpensesViewModel: ObservableObject {
    @Published var addExpenseViewShown = false
    
    @Published var items: [ExpenseModel] = []
    
    private let EXPENSE_STORAGE_KEY = "EXPENSE"
    
    init() {
        items = getExpensesFromStorage()
    }
    
    func showAddExpenseView() {
        addExpenseViewShown = true
    }
    
    func hideAddExpenseView() {
        addExpenseViewShown = false
    }
    
    func addExpense(title: String, price: Double, type: ExpenseType) {
        let expsense =  ExpenseModel(
            title: title,
            price: price,
            type: type
        )
        
        items.append(expsense)
        
        Storage.setItem(value: items, key: EXPENSE_STORAGE_KEY)
    }
    
    func moveExpense(_ from: IndexSet, _ to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func removeExpense(_ offset: IndexSet) {
        items.remove(atOffsets: offset)
        
        Storage.clearItems(key: EXPENSE_STORAGE_KEY)
    }
    
    private func getExpensesFromStorage() -> [ExpenseModel] {
        let storageExpenses = Storage.getItems(key: EXPENSE_STORAGE_KEY, type: [ExpenseModel].self)
        
        return storageExpenses ?? []
    }
}
