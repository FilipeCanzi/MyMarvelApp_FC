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

}


// MARK: - @objc Methods

extension ResultViewController {
    
    @objc func resultReturnButtonPressed(sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
}
