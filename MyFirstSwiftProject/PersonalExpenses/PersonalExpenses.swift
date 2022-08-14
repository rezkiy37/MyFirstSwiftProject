//
//  PersonalExpenses.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import SwiftUI

enum ExpenseType: String, CaseIterable  {
    case personal = "Personal"
    case business = "Business"
    case gift = "Gift"
    
}

struct Expense: Identifiable {
    let id = UUID()
    
    var title: String
    var price: Double
    var type: ExpenseType
}

class Expenses: ObservableObject {
    @Published var items: [Expense] = []
    
    init() {
        //        TODO: Test only
        self.items = [
            Expense(title: "test 1", price: 100, type: .business),
            Expense(title: "test 2", price: 100, type: .business),
            Expense(title: "test 3", price: 100, type: .business),
        ]
    }
}

struct PersonalExpenses: View {
    @State private var addViewShown = false
    
    @ObservedObject private var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("\(item.title)")
                                .font(.headline)
                                .padding(.bottom, 2)
                            
                            Text("\(item.type.rawValue)")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Text("\(item.price.description)$")
                    }
                }
                .onMove(perform: {
                    onMove($0, $1)
                })
                .onDelete {
                    onRemove($0)
                }
            }
            .navigationBarTitle("Personal expenses", displayMode: .inline)
            .toolbar {
                ToolbarItem(id: "EditButton", placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(id: "AddButton", placement: .navigationBarTrailing) {
                    Button {
                        addViewShown = true
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $addViewShown, content: {
                        AddView(expenses: expenses)
                    })
                }
            }
        }
    }
    
    func onMove(_ from: IndexSet, _ to: Int) {
        expenses.items.move(fromOffsets: from, toOffset: to)
    }
    
    func onRemove(_ offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct AddView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var priceInput = ""
    @State private var type = ExpenseType.personal.rawValue
    
    @State private var errorAlertShown: Bool = false
    
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Expense title", text: $title)
                
                TextField("Price", text: $priceInput)
                    .keyboardType(.numberPad)
                
                Picker("Expense type", selection: $type) {
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
                        if let price = Double(priceInput) {
                            expenses.items.append(
                                Expense(
                                    title: title,
                                    price: price,
                                    type: ExpenseType(rawValue: type) ?? ExpenseType.personal
                                )
                            )
                            
                            dismiss()
                        } else {
                            errorAlertShown = true
                        }
                    }.alert("Error", isPresented: $errorAlertShown) {
                        Button("OK") {
                            errorAlertShown = false
                        }
                    } message: {
                        Text("Price is incorrect")
                    }
                }
            })
        }
    }
}

struct PersonalExpenses_Previews: PreviewProvider {
    static var previews: some View {
        PersonalExpenses()
    }
}
