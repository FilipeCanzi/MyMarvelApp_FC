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
        deviceOrientation: UIDeviceOrientation,
        view: UIView,
        searchTextField: UITextField,
        searchButton: UIButton
    ) -> [NSLayoutConstraint] {
        
        switch deviceOrientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
                self.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15),
                self.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor)
            ]
            
            
        default:
            return [
                self.bottomAnchor.constraint(equalTo: searchTextField.topAnchor, constant: -15),
                self.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor)
            ]
            
        }
    }
    
}
