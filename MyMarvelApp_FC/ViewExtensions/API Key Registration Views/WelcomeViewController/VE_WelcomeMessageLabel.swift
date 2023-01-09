//
//  VE_WelcomeMessageLabel.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 13/12/22.
//

import UIKit

extension UILabel {
    
    func configureWelcomeMessageLabel(view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    
    func welcomeMessageLabelConstraints(
        view: UIView,
        welcomeQuestionLabel: UILabel,
        firstUserButton: UIButton,
        alreadyUserButton: UIButton
    ) -> [NSLayoutConstraint] {
        
        switch UIDevice.current.orientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
               
            ]
            
            
        default:
            return [
    
            ]
            
        }
    }
    
}
