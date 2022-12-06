//
//  VDE_ResultReturnButton.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 04/12/22.
//

import UIKit

extension UIButton {
    
    func configureResultReturnButton(view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.configuration = .filled()
        self.tintColor = .systemBlue
        
        self.setTitle("Search Again", for: .normal)
        
    }
    
    
    func resultReturnButtonConstraints(
        view: UIView,
        resultDescriptionLabel: UILabel
    ) -> [NSLayoutConstraint] {

        [
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.topAnchor.constraint(equalTo: resultDescriptionLabel.bottomAnchor, constant: 30),
            self.heightAnchor.constraint(equalToConstant: CSize.buttonHeight)
        ]
        
    }
    
}
