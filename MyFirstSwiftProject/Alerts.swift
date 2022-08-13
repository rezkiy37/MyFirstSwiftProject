//
//  Alerts.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 07.08.2022.
//

import Foundation
import SwiftUI

struct Alerts: View {
    @State private var infoAlertShown = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Show info alert") {
                    self.infoAlertShown = true
                }.alert(isPresented: $infoAlertShown) {
                    Alert(title: Text("Info alert"), message: Text("Some message..."), dismissButton: .cancel())
                }
            }.navigationBarTitle("Screen with alerts")
        }
    }
}
