//
//  ContentView.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 17.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled: Bool = true
    
    var body: some View {
        VStack {
            Button(action:{
                self.enabled.toggle()
                
            }) {
                Text("Hello, world!")
                .padding()
                .font(.headline)
                .foregroundColor(.black)

            }
            
            Toggle(isOn: $enabled) {
                Text("Is it enabled: \(enabled.description)")
            }
            
            if enabled {
                Text("Bay, world!")
                    .padding()
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
