//
//  HeadlineMidifier.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 13.08.2022.
//

import SwiftUI

struct headlineMidifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}
