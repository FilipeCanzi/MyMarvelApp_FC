//
//  VM_SearchButton.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 03/12/22.
//

import UIKit

extension UIButton {
    
    func configureSearchButton(view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.configuration = .filled()
        self.tintColor = .systemBlue
        
        self.setTitle("Search", for: .normal)
        
    }
    
    
    func searchButtonConstraints(
        view: UIView,
        searchTextField: UITextField
    ) -> [NSLayoutConstraint] {
        [
            self.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            self.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            self.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.30, constant: -20),
            self.heightAnchor.constraint(equalTo: searchTextField.heightAnchor)
        ]
    }
    
}
