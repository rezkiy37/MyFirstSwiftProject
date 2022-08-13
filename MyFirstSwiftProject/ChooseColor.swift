//
//  ChooseColor.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 11.08.2022.
//

import SwiftUI

let randomDiapason = 0...2

struct ChooseColor: View {
    @State private var colors = [
        Color.blue, Color.red, Color.gray, Color.black, Color.green, Color.purple, Color.yellow
    ].shuffled()
    
    @State private var correctAnswerIndex = Int.random(in: randomDiapason)
    
    @State private var answerDescription = ""
    
    @State private var answerAlertShown = false
    
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .purple, .pink], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Text(colors[correctAnswerIndex].description.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                
                ForEach(randomDiapason, id: \.self) { index in
                    Rectangle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(colors[index])
                        .shadow(color: .gray, radius: 2, x: 3, y: 3)
                        .border(.black, width: 3)
                        .padding(.bottom, 10)
                        .onTapGesture {
                            onSelect(index: index)
                        }
                }
                
                Text("Score: \(score.description)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .alert("Answer", isPresented: $answerAlertShown) {
            Button(role: .none) {
                answerAlertShown = false
            } label: {
                Text("Got it")
            }
            
        } message: {
            Text(answerDescription)
        }
        
        
    }
    
    func onSelect(index: Int) {
        if index == correctAnswerIndex {
            answerDescription = "Our congratulations 🔥"
            
            score += 1
        } else {
            answerDescription = "Do not worry and just try again 😉"
            
            if score > 0 {
                score -= 1
            }
        }
        
        answerAlertShown = true
        
        correctAnswerIndex = Int.random(in: randomDiapason)
        
        colors = colors.shuffled()
    }
}

struct ChooseColor_Previews: PreviewProvider {
    static var previews: some View {
        ChooseColor()
    }
}
