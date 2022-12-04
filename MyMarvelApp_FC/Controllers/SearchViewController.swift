//
//  ViewController.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 03/12/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchDescriptionLabel = UILabel()
    var searchTextField = UITextField()
    var searchButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureSearchViewController(
            view: view,
            searchDescriptionLabel: searchDescriptionLabel,
            searchTextField: searchTextField,
            searchButton: searchButton)
        
        searchDescriptionLabel.text = "Choose Character Name:"
        searchButton.addTarget(self, action: #selector(searchButtonPressed(sender:)), for: .touchUpInside)
        
    }

}




// MARK: - @objc Methods

extension SearchViewController {
    
    @objc func searchButtonPressed(sender: UIButton) {
        
        navigationController?.pushViewController(ResultViewController(), animated: true)
        
    }
}



// MARK: - UITextFieldDelegate

extension SearchViewController: UITextFieldDelegate {
    
}


