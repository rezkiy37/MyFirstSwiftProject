//
//  Tabs.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 30.07.2022.
//

import Foundation
import SwiftUI

struct Tabs: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Gestures()
                .tabItem {
                    Text("Gestures")
                }
                .tag(0)
            
            AuthorList()
                .tabItem {
                    Text("Authors")
                }
                .tag(1)
        }
    }
}

struct Tabs_Preview: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
