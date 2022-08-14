//
//  PersonalExpenses.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import SwiftUI

struct PersonalExpensesView: View {
    @ObservedObject private var viewModel = PersonalExpensesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    ExpenseView(
                        title: item.title,
                        price: item.price.description,
                        type: item.type.rawValue
                    )
                }
                .onMove(perform: {
                    viewModel.moveExpense($0, $1)
                })
                .onDelete {
                    viewModel.removeExpense($0)
                }
            }
            .navigationBarTitle("Personal expenses", displayMode: .inline)
            .toolbar {
                ToolbarItem(id: "EditButton", placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(id: "AddButton", placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showAddExpenseView()
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $viewModel.addExpenseViewShown, content: {
                        AddExpenseView(personalExpensesViewModel: viewModel)
                    })
                }
            }
        }
    }
    
    
}

struct PersonalExpenses_Previews: PreviewProvider {
    static var previews: some View {
        PersonalExpensesView()
    }
}
