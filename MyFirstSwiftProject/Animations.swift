//
//  Animations.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 22.10.2022.
//

import Foundation

import SwiftUI

struct ScallableButton: View {
    let maxScale: Float = 4.0
    let minScale: Float = 0.5
    
    @State private var scale: CGFloat = 1
    
    private var coefficient: CGFloat {
        return self.scale / 4
    }
    
    private var title: String {
        if Float(self.scale) == self.maxScale {
            return "Small me"
        }
        
        if Float(self.scale) == self.minScale {
            return "Big me"
        }
        
        return "Tap me"
    }
    
    private func onPress() -> Void {
        let potentialBiggerScale: Float = Float(self.scale + self.coefficient)
        let potentialSmallerScale: Float = Float(self.scale - self.coefficient)
        
        if Float(self.scale) == self.maxScale {
            self.decrement()
            
            return
        }
        
        if potentialBiggerScale >= self.maxScale {
            self.scale = CGFloat(self.maxScale)
            
            return
        }
        
        if Float(self.scale) >= self.minScale {
            self.increment()
            
            return
        }
        
        if potentialSmallerScale <= self.minScale {
            self.scale = CGFloat(self.minScale)
            
            return
        }
    }
    
    private func increment() {
        self.scale += self.coefficient
    }
    
    private func decrement() {
        self.scale -= self.coefficient
    }
    
    var body: some View {
        Button(action: onPress) {
            Text(title)
                .scaleEffect(self.scale)
        }
    }
}

struct RotatableButton: View {
    private let rotationAngle: Int = 30
    
    @State private var rotation: Double = 0
    
    private func onPress() -> Void {
        let baseAnimation = Animation.interpolatingSpring(
            mass: 0.5,
            stiffness: 10,
            damping: 0.5
        )
        
        withAnimation(baseAnimation) {
            self.rotation += Double(rotationAngle)
        }
    }
    
    var body: some View {
        Button(action: onPress) {
            Text("Rotate me")
                .rotationEffect(.degrees(self.rotation))
        }
    }
}

struct FlexibleEllipse: View {
    @State private var scale: CGFloat = 1.0
    
    private func onAppear() {
        let baseAnimation = Animation.linear(duration: 1)
        let repeatedAnimation = baseAnimation.repeatForever(autoreverses: true)
        
        withAnimation(repeatedAnimation) {
            self.scale = 0.5
        }
    }
    
    var body: some View {
        Ellipse()
            .frame(width: 100, height: 100)
            .foregroundColor(.gray)
            .scaleEffect(self.scale)
            .onAppear(perform: onAppear)
    }
}

struct FlexibleBox: View {
    @State private var cornerRadius: CGFloat = 4
    @State private var scale: CGFloat = 1
    
    private func onTap() {
        let baseAnimation = Animation
            .easeIn(duration: 1)
            .repeatCount(4, autoreverses: true)
        
        withAnimation(baseAnimation) {
            self.cornerRadius = 16
            self.scale = 1.5
            
        }
    }
    
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .cornerRadius(self.cornerRadius)
            .scaleEffect(self.scale)
            .foregroundColor(.brown)
            .onTapGesture(count: 2) {
                self.onTap()
            }
    }
}

struct Animations: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ScallableButton()
                
                Spacer()
                
                FlexibleEllipse()
                
                Spacer()
                
                FlexibleBox()
                
                Spacer()
                
                RotatableButton()
                
                Spacer()
            }
            .navigationTitle("Animations")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}
