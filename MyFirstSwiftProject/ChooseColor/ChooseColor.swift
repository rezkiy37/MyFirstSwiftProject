//
//  ChooseColor.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 11.08.2022.
//

import SwiftUI

struct ChooseColor: View {
    @ObservedObject private var viewModel: ChooseColorViewModel
    
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
                Text(viewModel.chooseColorTitle)
                    .fontWeight(.bold)
                    .modifier(headlineMidifier())
                
                ForEach(viewModel.randomDiapason, id: \.self) { index in
                    ColorButton(index: index, colors: viewModel.colors) {
                        controller.onSelect(index)
                    }
                }
                
                Text(viewModel.scoreTitle)
                    .fontWeight(.bold)
                    .modifier(headlineMidifier())
            }
        }
        .alert("Answer", isPresented: $viewModel.answerAlertShown) {
            Button(role: .none) {
                controller.onAnswerAlertConfirm()
            } label: {
                Text("Got it")
            }
        } message: {
            Text(viewModel.answerDescription)
        }
    }
    
    init() {
        let localChooseColorViewModel = ChooseColorViewModel()
        let localChooseColorController = ChooseColorController(localChooseColorViewModel)
        
        self.viewModel = localChooseColorViewModel
        self.controller = localChooseColorController
    }
}

struct ChooseColor_Previews: PreviewProvider {
    static var previews: some View {
        ChooseColor()
    }
}
