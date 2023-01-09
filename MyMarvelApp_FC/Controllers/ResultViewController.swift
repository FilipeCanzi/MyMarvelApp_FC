//
//  ResultViewController.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 04/12/22.
//

import UIKit

class ResultViewController: UIViewController {

    var resultTitleLabel = UILabel()
    var resultImageView = UIImageView()
    var resultDescriptionLabel = UILabel()
    var resultReturnButton = UIButton()
    
    var data: MarvelData?
    var researchRequest: ResearchRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureResultViewController(
            view: view,
            resultTitleLabel: resultTitleLabel,
            resultImageView: resultImageView,
            resultDescriptionLabel: resultDescriptionLabel,
            resultReturnButton: resultReturnButton)
        
        resultReturnButton.addTarget(self, action: #selector(resultReturnButtonPressed(sender:)), for: .touchUpInside)
        
    }
    
    convenience init(data: MarvelData, researchRequest: ResearchRequest) {
        self.init()
                
        self.data = data
        self.researchRequest = researchRequest
        
        switch researchRequest.marvelEntity {
        case .comics:
            self.resultTitleLabel.text = data.title
        case .characters:
            self.resultTitleLabel.text = data.name
        }
        
        self.resultDescriptionLabel.text = data.description
        
        let thumbnailURL: String = "\(data.thumbnail.path).\(data.thumbnail.extension)"
        
        self.resultImageView.loadImageFromRemoteURL(urlString: thumbnailURL)
    }
    
}


// MARK: - @objc Methods

extension ResultViewController {
    
    @objc func resultReturnButtonPressed(sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
}
