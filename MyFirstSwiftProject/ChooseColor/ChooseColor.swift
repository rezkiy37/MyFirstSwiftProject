//
//  ChooseColor.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 11.08.2022.
//

import SwiftUI

struct ChooseColor: View {
    @ObservedObject private var model: ChooseColorModel
    
    private let controller: ChooseColorController!
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.mint, .purple, .pink],
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(model.chooseColorTitle)
                    .fontWeight(.bold)
                    .headline()
                
                ForEach(model.randomDiapason, id: \.self) { index in
                    ColorButton(index: index, colors: model.colors) {
                        controller.onSelect(index)
                    }
                }
                
                Text(model.scoreTitle)
                    .fontWeight(.bold)
                    .headline()
            }
        }
        .alert("Answer", isPresented: $model.answerAlertShown) {
            Button(role: .none) {
                controller.onAnswerAlertConfirm()
            } label: {
                Text("Got it")
            }
        } message: {
            Text(model.answerDescription)
        }
    }
    
    init() {
        let localChooseColorViewModel = ChooseColorModel()
        let localChooseColorController = ChooseColorController(localChooseColorViewModel)
        
        self.model = localChooseColorViewModel
        self.controller = localChooseColorController
    }
}

struct ChooseColor_Previews: PreviewProvider {
    static var previews: some View {
        ChooseColor()
    }
}
