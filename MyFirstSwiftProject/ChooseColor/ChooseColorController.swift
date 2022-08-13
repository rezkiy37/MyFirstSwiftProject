//
//  ChooseColorController.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 13.08.2022.
//

import Foundation
import UIKit

class ChooseColorController: UIResponder {
    let chooseColorViewModel: ChooseColorViewModel!
    
    init(_ chooseColorViewModel: ChooseColorViewModel) {
        self.chooseColorViewModel = chooseColorViewModel
    }
    
    func onSelect(_ index: Int) {
        if index == chooseColorViewModel.correctAnswerIndex {
            chooseColorViewModel.setSuccesfulAnswerDesciprion()
            
            chooseColorViewModel.increaseScore()
        } else {
            chooseColorViewModel.setFailureAnswerDesciprion()
            
            chooseColorViewModel.decreaseScore()
        }
        
        chooseColorViewModel.showAnswerAlert()
        
        chooseColorViewModel.generateRandomCorrectAnswerIndex()
        
        chooseColorViewModel.shuffleColors()
    }
    
    func onAnswerAlertConfirm () {
        chooseColorViewModel.hideAnswerAlert()
    }
}
