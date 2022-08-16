//
//  Expense.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import Foundation

struct ExpenseModel: Identifiable, Codable {
    var id = UUID()
    
    var title: String
    var price: Double
    var type: ExpenseType
}
