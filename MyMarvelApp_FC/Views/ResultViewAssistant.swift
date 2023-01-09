//
//  ResultView.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 08/01/23.
//

import UIKit

class ResultViewAssistant {
    
    let controller: ResultViewController
    
    let view: UIView
    
    let resultTitleLabel: UILabel
    let resultImageView: UIImageView
    let resultDescriptionLabel: UILabel
    let resultReturnButton: UIButton
    let resultFavoriteButton: UIButton
    
    
    init(controller: ResultViewController) {
        
        self.controller = controller
        
        self.view = controller.view
        
        self.resultTitleLabel = controller.resultTitleLabel
        self.resultImageView = controller.resultImageView
        self.resultDescriptionLabel = controller.resultDescriptionLabel
        self.resultReturnButton = controller.resultReturnButton
        self.resultFavoriteButton = controller.resultFavoriteButton
        
    }
    
    
    func configure() {
                       
        view.backgroundColor = UIColor(named: AColor.backgroundColor)

        configureResultTitleLabel()
        configureResultImageView()
        configureResultDescriptionLabel()
        configureResultReturnButton()
        
        activateResultViewConstraints()

    }
        
    
    func activateResultViewConstraints() {
        
        NSLayoutConstraint.activate(
            
            resultTitleLabelConstraints()
            +
            resultImageViewConstraints()
            +
            resultDescriptionLabelConstraints()
            +
            resultReturnButtonConstraints()
            
        )
        
    }
    
    
    func viewIsTransiting() {
        controller.removeAndAddAllSubviews(view: view)
        activateResultViewConstraints()
    }
    
}



// MARK: - ResultTitleLabel

extension ResultViewAssistant {
    
    func configureResultTitleLabel() {
                
        view.addSubview(resultTitleLabel)
        
        resultTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultTitleLabel.numberOfLines = 0
        resultTitleLabel.font = UIFont.systemFont(ofSize: 25)
        
    }
    
    
    func resultTitleLabelConstraints() -> [NSLayoutConstraint] {
        
        switch UIDevice.current.orientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
                resultTitleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
                resultTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
            
        default:
            return [
                resultTitleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
                resultTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
        }
    }
    
}


// MARK: - ResultImageView

extension ResultViewAssistant {
    
    func configureResultImageView() {
        
        view.addSubview(resultImageView)
        
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.contentMode = .scaleAspectFit

    }
    
    
    func resultImageViewConstraints() -> [NSLayoutConstraint] {
        
        switch UIDevice.current.orientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
                resultImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultImageView.topAnchor.constraint(equalTo: resultTitleLabel.bottomAnchor, constant: 20),
                resultImageView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.40),
            ]
            
            
        default:
            return [
                resultImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultImageView.topAnchor.constraint(equalTo: resultTitleLabel.bottomAnchor, constant: 20),
                resultImageView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.40),
            ]
        }
    }
    
}


// MARK: - ResultDescriptionLabel

extension ResultViewAssistant {
    
    func configureResultDescriptionLabel() {
                
        view.addSubview(resultDescriptionLabel)
        
        resultDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultDescriptionLabel.numberOfLines = 0
        resultDescriptionLabel.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    
    func resultDescriptionLabelConstraints() -> [NSLayoutConstraint] {
        
        switch UIDevice.current.orientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
                resultDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultDescriptionLabel.topAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: 20),
                resultDescriptionLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.90)
            ]
            
        default:
            return [
                resultDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultDescriptionLabel.topAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: 20),
                resultDescriptionLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.90)
            ]
        }
    }
    
}


// MARK: - ResultReturnButton

extension ResultViewAssistant {
    
    func configureResultReturnButton() {
                
        view.addSubview(resultReturnButton)
        
        resultReturnButton.translatesAutoresizingMaskIntoConstraints = false
        
        resultReturnButton.configuration = .filled()
        resultReturnButton.tintColor = .systemBlue
        
        resultReturnButton.setTitle("Search Again", for: .normal)
        
    }
    
    
    func resultReturnButtonConstraints() -> [NSLayoutConstraint] {
        
        switch UIDevice.current.orientation {
            
        case .landscapeLeft, .landscapeRight:
            return [
                resultReturnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultReturnButton.topAnchor.constraint(equalTo: resultDescriptionLabel.bottomAnchor, constant: 30),
                resultReturnButton.heightAnchor.constraint(equalToConstant: CSize.buttonHeight)
            ]
            
        default:
            return [
                resultReturnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultReturnButton.topAnchor.constraint(equalTo: resultDescriptionLabel.bottomAnchor, constant: 30),
                resultReturnButton.heightAnchor.constraint(equalToConstant: CSize.buttonHeight)
            ]
        }
    }
    
}
