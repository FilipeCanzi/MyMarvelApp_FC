//
//  VDE_ResultViewController.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 04/12/22.
//

import UIKit

extension UIViewController {
    
    func configureResultViewController(
        view: UIView,
        resultTitleLabel: UILabel,
        resultImageView: UIImageView,
        resultDescriptionLabel: UILabel,
        resultReturnButton: UIButton
    ) {
        
        view.backgroundColor = UIColor(named: AColor.backgroundColor)
        
        resultTitleLabel.configureResultTitleLabel(view: view)
        
        resultImageView.configureResultImageView(view: view)
        
        resultDescriptionLabel.configureResultDescriptionLabel(view: view)

        resultReturnButton.configureResultReturnButton(view: view)
        
        NSLayoutConstraint.activate(
            resultTitleLabel.resultTitleLabelConstraints(view: view) +
            resultImageView.resultImageViewConstraints(view: view, resultTitleLabel: resultTitleLabel) +
            resultDescriptionLabel.resultDescriptionLabelConstraints(view: view, resultImageView: resultImageView) +
            resultReturnButton.resultReturnButtonConstraints(view: view, resultDescriptionLabel: resultDescriptionLabel)
        )
        
    
    }
    
}
