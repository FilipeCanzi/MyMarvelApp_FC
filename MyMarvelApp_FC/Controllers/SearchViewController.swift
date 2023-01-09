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
    
    var apiManager = MarvelAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureSearchViewController(
            view: view,
            searchDescriptionLabel: searchDescriptionLabel,
            searchTextField: searchTextField,
            searchButton: searchButton)
        
        searchDescriptionLabel.text = "Choose Character Name:"
        searchTextField.placeholder = "Enter Character Name"
        searchButton.addTarget(self, action: #selector(searchButtonPressed(sender:)), for: .touchUpInside)
        
        apiManager.delegate = self
        
    }

}




// MARK: - @objc Methods

extension SearchViewController {
    
    @objc func searchButtonPressed(sender: UIButton) {
        
        let researchRequest = ResearchRequest(
            marvelEntity: .characters,
            marvelAttribute: .name,
            userText: "Storm")
        
        apiManager.makeApplicationCall(with: researchRequest)
        
    }
}



// MARK: - MarvelAPIManagerDelegate

extension SearchViewController: MarvelAPIManagerDelegate {

    
    func didReceiveData(_: MarvelAPIManager, data: MarvelObject, researchRequest: ResearchRequest) {
     
        DispatchQueue.main.async {
            let dataResult = data.data.results[0]
            
            let resultVC = ResultViewController(data: dataResult, researchRequest: researchRequest)
            
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    func didFailWithError(err: Error?) {
        if let err { print(err) }
    } 
}


// MARK: - Orientation Methods

extension SearchViewController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        super.viewWillTransition(to: size, with: coordinator)
                
        removeAndAddAllSubviews(view: view)
        
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
    
    
}
