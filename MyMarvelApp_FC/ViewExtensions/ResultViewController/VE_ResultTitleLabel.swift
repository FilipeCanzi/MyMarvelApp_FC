//
//  VDE_ResultTitleLabel.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 04/12/22.
//

import UIKit

extension UILabel {
    
    func configureResultTitleLabel(view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 25)
        
    }
    
    
    func resultTitleLabelConstraints(
        view: UIView,
        resultImageView: UIImageView,
        resultDescriptionLabel: UILabel,
        resultReturnButton: UIButton
    ) -> [NSLayoutConstraint] {

        switch UIDevice.current.orientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
                self.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
            
            
        default:
            return [
                self.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
        }
    }
    
}
