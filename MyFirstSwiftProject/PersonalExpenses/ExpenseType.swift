//
//  ExpenseType.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import Foundation

enum ExpenseType: String, CaseIterable, Codable  {
    case personal = "Personal"
    case business = "Business"
    case gift = "Gift"
}
