//
//  ColorButton.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 13.08.2022.
//

import SwiftUI

struct ColorButton: View {
    let index: Int
    let colors: [Color]
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 150, height: 150)
            .foregroundColor(colors[index])
            .shadow(color: .black, radius: 3, x: 2, y: 5)
            .padding(.bottom, 10)
        }
    }
}
