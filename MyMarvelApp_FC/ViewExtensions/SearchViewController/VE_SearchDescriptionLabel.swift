//
//  SearchDescriptionLabel.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 03/12/22.
//

import UIKit

extension UILabel {
    
    func configureSearchDescriptionLabel(view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    
    func searchDescriptionLabelConstraints(
        view: UIView,
        searchTextField: UITextField
    ) -> [NSLayoutConstraint] {

        [
            self.bottomAnchor.constraint(equalTo: searchTextField.topAnchor, constant: -15),
            self.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor)
        ]
        
    }
    
}