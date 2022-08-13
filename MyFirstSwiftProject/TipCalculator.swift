//
//  TipCalculator.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 02.08.2022.
//

import Foundation
import SwiftUI

struct TipCalculator: View {
    private let minPeopleCount: Int = 2
    private let maxPeopleCount: Int = 30
    private let tipPersentages = [0, 10, 15, 20]
    
    @State private var amount = ""
    @State private var peopleCount = 5
    @State private var tipPersentage = 0
    
    var totalSum: Double {
        let seletedTip = Double(tipPersentages[tipPersentage])
        
        let orderSum = Double(amount) ?? 0
        
        let tipValue = orderSum / 100 * seletedTip
        
        let totalSum = orderSum + tipValue
        
        let sumPerPerson: Double = totalSum / Double(peopleCount)
        
        return sumPerPerson
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Enter amount") {
                        TextField("Amount", text: $amount)
                            .keyboardType(.numberPad)
                            .submitLabel(.return)
                    }
                    
                    Section("Choose people count") {
                        Picker("People count", selection: $peopleCount) {
                            ForEach(minPeopleCount...maxPeopleCount, id: \.self) {
                                Text("\($0) people")
                            }
                        }.pickerStyle(.menu)
                    }
                    
                    Section("Choose tip persentage") {
                        Picker("Tip persentage", selection: $tipPersentage) {
                            ForEach(0..<tipPersentages.count, id: \.self) {
                                Text("\(tipPersentages[$0])%")
                            }
                        }
                    }.pickerStyle(.wheel)
                }
                
                
                Text("Sum per person: \(totalSum, specifier: "%.2f")")
            }.navigationBarTitle("Tip calculator", displayMode: .inline)
        }
        
    }
}


struct TipCalculator_Preview: PreviewProvider {
    static var previews: some View {
        TipCalculator()
    }
}
