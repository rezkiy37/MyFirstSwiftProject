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
    
    func showAddExpenseView() {
        addExpenseViewShown = true
    }
    
    func hideAddExpenseView() {
        addExpenseViewShown = false
    }
    
    func addExpense(title: String, price: Double, type: ExpenseType) {
        items.append(
            ExpenseModel(
                title: title,
                price: price,
                type: type
            )
        )
    }
    
    func moveExpense(_ from: IndexSet, _ to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func removeExpense(_ offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
}
