//
//  ExpenseView.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import SwiftUI

struct ExpenseView: View {
    let title: String
    let price: String
    let type: String
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .padding(.bottom, 2)
                
                Text(type)
                    .font(.caption)
            }
            
            Spacer()
            
            Text("\(price)$")
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView(
            title: "Preview example",
            price: "100",
            type: ExpenseType.personal.rawValue
        )
    }
}
