//
//  VDE_ResultImage.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 04/12/22.
//

import UIKit

extension UIImageView {
    
    func configureResultImageView(view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFit
        
    }
    
    
    func resultImageViewConstraints(
        view: UIView,
        resultTitleLabel: UILabel
    ) -> [NSLayoutConstraint] {

        [
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.topAnchor.constraint(equalTo: resultTitleLabel.bottomAnchor, constant: 20),
            self.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.40),
        ]
        
    }
    
}
