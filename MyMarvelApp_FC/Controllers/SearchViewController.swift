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
    
    
    func didReceiveCharacterData(_: MarvelAPIManager, data: MarvelCharacterObject) {
        
        DispatchQueue.main.async {
            
            let resultVC = ResultViewController()
            
            let dataResult = data.data.results[0]

            resultVC.resultTitleLabel.text = dataResult.name
            resultVC.resultDescriptionLabel.text = dataResult.description
            
            let thumbnailURL: String = "\(dataResult.thumbnail.path).\(dataResult.thumbnail.extension)"
            resultVC.resultImageView.loadImageFromURL(urlString: thumbnailURL)
            
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    
    func didReceiveComicsData(_: MarvelAPIManager, data: MarvelComicsObject) {
        
        DispatchQueue.main.async {
            
            let resultVC = ResultViewController()
            
            let dataResult = data.data.results[0]

            resultVC.resultTitleLabel.text = dataResult.title
            resultVC.resultDescriptionLabel.text = dataResult.description
            
            let thumbnailURL: String = "\(dataResult.thumbnail.path).\(dataResult.thumbnail.extension)"
            resultVC.resultImageView.loadImageFromURL(urlString: thumbnailURL)
            
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    
    func didFailWithError(err: Error?) {
        if let err { print(err) }
    }
    
    
    
}


