//
//  Home.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 13.08.2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Gestures") {
                    Gestures()
                }
                
                NavigationLink("Author list") {
                    AuthorList()
                }
                
                NavigationLink("Tip calculator") {
                    TipCalculator()
                }
                
                NavigationLink("Alerts") {
                    Alerts()
                }
                
                NavigationLink("Choose color") {
                   ChooseColor()
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
