//
//  ViewModel.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 13.08.2022.
//

import Foundation
import SwiftUI

class ChooseColorViewModel: ObservableObject {
    let randomDiapason = 0...2
    
    @Published var colors = [
        Color.blue, Color.red, Color.gray, Color.black, Color.green, Color.purple, Color.yellow
    ].shuffled()
    
    @Published var correctAnswerIndex: Int!
    
    @Published var answerDescription = ""
    
    @Published var answerAlertShown = false
    
    @Published var score = 0
    
    var chooseColorTitle: String {
        get {
            return colors[correctAnswerIndex].description.uppercased()
        }
    }
    
    var scoreTitle: String {
        get {
            return "Score: \(score.description)"
        }
    }
    
    init() {
        generateRandomCorrectAnswerIndex()
    }
    
    func showAnswerAlert() {
        answerAlertShown = true
    }
    
    func hideAnswerAlert() {
        answerAlertShown = false
    }
    
    func increaseScore() {
        score += 1
    }
    
    func decreaseScore() {
        if score > 0 {
            score -= 1
        }
    }
    
    func shuffleColors() {
        colors.shuffle()
    }
    
    func setSuccesfulAnswerDesciprion() {
        answerDescription = "Our congratulations 🔥"
    }
    
    func setFailureAnswerDesciprion() {
        answerDescription = "Do not worry and just try again 😉"
    }
    
    func generateRandomCorrectAnswerIndex() {
        correctAnswerIndex = Int.random(in: randomDiapason)
    }
}
