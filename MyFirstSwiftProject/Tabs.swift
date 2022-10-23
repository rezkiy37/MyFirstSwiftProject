//
//  Tabs.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 30.07.2022.
//

import Foundation
import SwiftUI

struct Tab: View {
    let systemImageName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: systemImageName)
            
            Text(title)
        }
    }
}

struct Tabs: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Gestures()
                .tabItem {
                    Tab(systemImageName: "hand.tap", title: "Gestures")
                }
                .tag(0)
            
            AuthorList()
                .tabItem {
                    Tab(systemImageName: "person", title: "Authors")
                }
                .tag(1)
            
            TipCalculator()
                .tabItem {
                    Tab(systemImageName: "plus.forwardslash.minus", title: "Tip calculator")
                }
                .tag(3)
            
            Alerts()
                .tabItem {
                    Tab(systemImageName: "message", title: "Alerts")
                }
                .tag(3)
        }
    }
}

struct Tabs_Preview: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
