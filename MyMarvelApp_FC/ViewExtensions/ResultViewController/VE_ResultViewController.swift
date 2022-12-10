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

        
        activateResultViewControllerConstraints(
            view: view,
            resultTitleLabel: resultTitleLabel,
            resultImageView: resultImageView,
            resultDescriptionLabel: resultDescriptionLabel,
            resultReturnButton: resultReturnButton)
        
    }
    
    
    func activateResultViewControllerConstraints(
        view: UIView,
        resultTitleLabel: UILabel,
        resultImageView: UIImageView,
        resultDescriptionLabel: UILabel,
        resultReturnButton: UIButton
    ) {
        
        NSLayoutConstraint.activate(
            
            resultTitleLabel.resultTitleLabelConstraints(view: view, resultImageView: resultImageView, resultDescriptionLabel: resultDescriptionLabel, resultReturnButton: resultReturnButton) +
            
            resultImageView.resultImageViewConstraints(view: view, resultTitleLabel: resultTitleLabel, resultDescriptionLabel: resultDescriptionLabel, resultReturnButton: resultReturnButton) +
            
            resultDescriptionLabel.resultDescriptionLabelConstraints(view: view, resultTitleLabel: resultTitleLabel, resultImageView: resultImageView, resultReturnButton: resultReturnButton) +
            
            resultReturnButton.resultReturnButtonConstraints(view: view, resultTitleLabel: resultTitleLabel, resultImageView: resultImageView, resultDescriptionLabel: resultDescriptionLabel)
        
        )
        
    }
    
}
