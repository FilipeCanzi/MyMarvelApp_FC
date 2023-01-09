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
                
        NSLayoutConstraint.activate(
            searchViewControllerConstrains(
                deviceOrientation: UIDevice.current.orientation,
                view: view,
                searchDescriptionLabel: searchDescriptionLabel,
                searchTextField: searchTextField,
                searchButton: searchButton
            )
        )
            
    }
    


    func searchViewControllerConstrains(
        deviceOrientation: UIDeviceOrientation,
        view: UIView,
        searchDescriptionLabel: UILabel,
        searchTextField: UITextField,
        searchButton: UIButton
    ) -> [NSLayoutConstraint] {
        
        searchTextField.searchTextFieldConstraints(deviceOrientation: deviceOrientation, view: view, searchDescriptionLabel: searchDescriptionLabel, searchButton: searchButton) +
        
        searchDescriptionLabel.searchDescriptionLabelConstraints(deviceOrientation: deviceOrientation, view: view, searchTextField: searchTextField, searchButton: searchButton) +
        
        searchButton.searchButtonConstraints(deviceOrientation: deviceOrientation, view: view, searchDescriptionLabel: searchDescriptionLabel, searchTextField: searchTextField)
        
    }
    
}


