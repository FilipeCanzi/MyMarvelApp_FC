//
//  WelcomeViewAssistant.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 08/01/23.
//

import UIKit

class WelcomeViewAssistant {
    
    let controller: WelcomeViewController
    
    let view: UIView
    
    let welcomeMessageLabel: UILabel
    let welcomeQuestionLabel: UILabel
    let firstUserButton: UIButton
    let alreadyUserButton: UIButton
    
    init(controller: WelcomeViewController) {
        
        self.controller = controller
        
        self.view = controller.view
        
        self.welcomeMessageLabel = controller.welcomeMessageLabel
        self.welcomeQuestionLabel = controller.welcomeQuestionLabel
        self.firstUserButton = controller.firstUserButton
        self.alreadyUserButton = controller.alreadyUserButton
    }
    
    
}
