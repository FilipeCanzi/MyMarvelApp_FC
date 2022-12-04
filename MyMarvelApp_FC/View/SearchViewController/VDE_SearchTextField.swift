//
//  SearchTextField.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 03/12/22.
//

import UIKit

extension UITextField {
    
    func configureSearchTextField(view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.borderStyle = .roundedRect
        self.backgroundColor = .systemGray4
        
        self.returnKeyType = .search
         
    }
    
    
    func searchTextFieldConstraints(
        view: UIView
    ) -> [NSLayoutConstraint] {
        [
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
            self.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.68, constant: -20),
            self.heightAnchor.constraint(equalToConstant: 40)
            
        ]
    }
    
}
