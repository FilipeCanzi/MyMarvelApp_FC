//
//  VDE_SearchViewController.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 04/12/22.
//

import UIKit

extension UIViewController {
    
    func configureSearchViewController(
        view: UIView,
        searchDescriptionLabel: UILabel,
        searchTextField: UITextField,
        searchButton: UIButton
    ) {
        
        view.backgroundColor = UIColor(named: AColor.backgroundColor)
        
        searchDescriptionLabel.configureSearchDescriptionLabel(view: view)
        
        searchTextField.configureSearchTextField(view: view)
        
        searchButton.configureSearchButton(view: view)
        
        activateSearchViewControllerConstraints(
            view: view,
            searchDescriptionLabel: searchDescriptionLabel,
            searchTextField: searchTextField,
            searchButton: searchButton)
        
    }
    
    
    func activateSearchViewControllerConstraints(
        view: UIView,
        searchDescriptionLabel: UILabel,
        searchTextField: UITextField,
        searchButton: UIButton
    ) {
        
        NSLayoutConstraint.activate(
            
            searchTextField.searchTextFieldConstraints(view: view, searchDescriptionLabel: searchDescriptionLabel, searchButton: searchButton) +
            
            searchDescriptionLabel.searchDescriptionLabelConstraints(view: view, searchTextField: searchTextField, searchButton: searchButton) +
            
            searchButton.searchButtonConstraints(view: view, searchDescriptionLabel: searchDescriptionLabel, searchTextField: searchTextField)
        
        )
        
    }
    
    
}
