//
//  VE_WelcomeViewController.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 13/12/22.
//

import UIKit

extension UIViewController {
    
    func configureWelcomeViewController(
        view: UIView,
        welcomeMessageLabel: UILabel,
        welcomeQuestionLabel: UILabel,
        firstUserButton: UIButton,
        alreadyUserButton: UIButton
    ) {
        
        view.backgroundColor = UIColor(named: AColor.backgroundColor)
        
        
        
        activateWelcomeViewControllerConstraints(
            view: view,
            welcomeMessageLabel: welcomeMessageLabel,
            welcomeQuestionLabel: welcomeQuestionLabel,
            firstUserButton: firstUserButton,
            alreadyUserButton: alreadyUserButton)
        
    }
    
    
    func activateWelcomeViewControllerConstraints(
        view: UIView,
        welcomeMessageLabel: UILabel,
        welcomeQuestionLabel: UILabel,
        firstUserButton: UIButton,
        alreadyUserButton: UIButton
    ) {
        
//        NSLayoutConstraint.activate(
//            
//        )
        
    }
    
    
}
