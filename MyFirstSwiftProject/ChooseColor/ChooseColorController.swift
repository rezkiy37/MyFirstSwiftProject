//
//  ChooseColorController.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 13.08.2022.
//

import Foundation
import SwiftUI

class ChooseColorController: UIResponder {
    let model: ChooseColorModel!
    
    init(_ chooseColorViewModel: ChooseColorModel) {
        self.model = chooseColorViewModel
    }
    
    func onSelect(_ index: Int) {
        if index == model.correctAnswerIndex {
            model.setSuccesfulAnswerDesciprion()
            
            model.increaseScore()
        } else {
            model.setFailureAnswerDesciprion()
            
            model.decreaseScore()
        }
        
        model.showAnswerAlert()
        
        model.generateRandomCorrectAnswerIndex()
        
        model.shuffleColors()
    }
    
    func onAnswerAlertConfirm () {
        model.hideAnswerAlert()
    }
}
