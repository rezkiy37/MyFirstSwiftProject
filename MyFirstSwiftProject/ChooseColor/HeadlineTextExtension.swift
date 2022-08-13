//
//  HeadlineTextExtension.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 13.08.2022.
//

import SwiftUI

extension View {
    func headline() -> some View {
        self.modifier(headlineMidifier())
    }
}
