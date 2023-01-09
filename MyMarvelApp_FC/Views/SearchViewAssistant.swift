//
//  SearchViewAssistant.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 08/01/23.
//

import UIKit

class SearchViewAssistant {
    
    let controller: SearchViewController
    
    let view: UIView
    
    let searchDescriptionLabel: UILabel
    let searchTextField:  UITextField
    let searchButton:  UIButton
    
    init(controller: SearchViewController) {
        
        self.controller = controller
        
        self.view = controller.view
        
        self.searchDescriptionLabel = controller.searchDescriptionLabel
        self.searchTextField = controller.searchTextField
        self.searchButton = controller.searchButton
        
    }
    
    
    func configure() {
                       
        view.backgroundColor = UIColor(named: AColor.backgroundColor)
        
        configureSearchDescriptionLabel(view: view)
        configureSearchTextField(view: view)
        configureSearchButton(view: view)
        
        activateSearchViewConstraints()

    }
    
    
    func activateSearchViewConstraints() {
        
        NSLayoutConstraint.activate(
            
            searchTextFieldConstraints()
            +
            searchDescriptionLabelConstraints()
            +
            searchButtonConstraints()
            
        )
        
    }
    
    
    func viewIsTransiting() {
       controller.removeAndAddAllSubviews(view: view)
       activateSearchViewConstraints()
   }
    
}


// MARK: - SearchDescriptionLabel

extension SearchViewAssistant {
    
    func configureSearchDescriptionLabel(view: UIView) {
        
        view.addSubview(searchDescriptionLabel)
        
        searchDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        searchDescriptionLabel.numberOfLines = 0
        searchDescriptionLabel.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    
    func searchDescriptionLabelConstraints() -> [NSLayoutConstraint] {
        
        switch UIDevice.current.orientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
                searchDescriptionLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15),
                searchDescriptionLabel.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor)
            ]
            
        default:
            return [
                searchDescriptionLabel.bottomAnchor.constraint(equalTo: searchTextField.topAnchor, constant: -15),
                searchDescriptionLabel.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor)
            ]
        }
    }
    
}

// MARK: - SearchTextField

extension SearchViewAssistant {
    
    func configureSearchTextField(view: UIView) {
        
        view.addSubview(searchTextField)
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemGray4
        
        searchTextField.returnKeyType = .search
         
    }
    
    
    func searchTextFieldConstraints() -> [NSLayoutConstraint] {
                
        switch UIDevice.current.orientation {
          
        case .landscapeLeft, .landscapeRight:
            return [
                searchTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                searchTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
                searchTextField.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.68, constant: -20),
                searchTextField.heightAnchor.constraint(equalToConstant: CSize.buttonHeight)
            ]
            
        default:
            return [
                searchTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                searchTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
                searchTextField.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.68, constant: -20),
                searchTextField.heightAnchor.constraint(equalToConstant: CSize.buttonHeight)
            ]
        }
    }
    
}

// MARK: - SearchButton

extension SearchViewAssistant {
    

    func configureSearchButton(view: UIView) {
        
        view.addSubview(searchButton)
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        searchButton.configuration = .filled()
        searchButton.tintColor = .systemBlue
        
        searchButton.setTitle("Search", for: .normal)
        
    }
    
    
    func searchButtonConstraints() -> [NSLayoutConstraint] {
        
        switch UIDevice.current.orientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
                searchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
                searchButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
                searchButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.30, constant: -20),
                searchButton.heightAnchor.constraint(equalToConstant: CSize.buttonHeight)
            ]
            
        default:
            return [
                searchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
                searchButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
                searchButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.30, constant: -20),
                searchButton.heightAnchor.constraint(equalToConstant: CSize.buttonHeight)
            ]
        }
    }
    
}
