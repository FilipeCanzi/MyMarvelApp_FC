//
//  VDE_ResultDescriptionLabel.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 04/12/22.
//

import UIKit

extension UILabel {
    
    func configureResultDescriptionLabel(view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    
    func resultDescriptionLabelConstraints(
        view: UIView,
        resultImageView: UIImageView
    ) -> [NSLayoutConstraint] {

        [
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.topAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: 20),
            self.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.90)
            
        ]
        
    }
    
}
