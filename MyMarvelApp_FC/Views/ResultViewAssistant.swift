//
//  ResultView.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 08/01/23.
//

import UIKit

protocol ResultViewAssistantDelegate {
        
    var resultTitleLabel: UILabel { get }
    var resultImageView: UIImageView { get }
    var resultDescriptionLabel: UILabel { get }
    var resultReturnButton: UIButton { get }
    var resultFavoriteButton: UIButton { get }
    
}

class ResultViewAssistant {
    
    var delegate: ResultViewAssistantDelegate?
    
    var resultTitleLabel = UILabel()
    var resultImageView = UIImageView()
    var resultDescriptionLabel = UILabel()
    var resultReturnButton = UIButton()
    var resultFavoriteButton = UIButton()
    
    
    func configure(view: UIView) {
                
        print("SETUP DONE")
        
        setupResultViewAssistant()
        
        print("SETUP DONE")
        
        view.backgroundColor = UIColor(named: AColor.backgroundColor)

        configureResultTitleLabel(view: view)
//        configureResultImageView(view: view)
//        configureResultDescriptionLabel(view: view)
//        configureResultReturnButton(view: view)
        
        activateResultViewConstraints(view: view)

    }
    
    func setupResultViewAssistant() {
        
        guard
            let resultTitleLabel  = delegate?.resultTitleLabel,
            let resultImageView  = delegate?.resultImageView,
            let resultDescriptionLabel  = delegate?.resultDescriptionLabel,
            let resultReturnButton  = delegate?.resultReturnButton,
            let resultFavoriteButton  = delegate?.resultFavoriteButton
        else { return }
        
        self.resultTitleLabel = resultTitleLabel
        self.resultImageView = resultImageView
        self.resultDescriptionLabel = resultDescriptionLabel
        self.resultReturnButton = resultReturnButton
        self.resultFavoriteButton = resultFavoriteButton
        
    }
    
    
    func activateResultViewConstraints(view: UIView) {
        
        NSLayoutConstraint.activate(
            
            resultTitleLabelConstraints(view: view)
            +
            resultImageViewConstraints(view: view)
            +
            resultDescriptionLabelConstraints(view: view)
            +
            resultReturnButtonConstraints(view: view)
            
        )
        
    }
    
    func configureResultTitleLabel(view: UIView) {
                
        view.addSubview(resultTitleLabel)
        
        resultTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultTitleLabel.numberOfLines = 0
        resultTitleLabel.font = UIFont.systemFont(ofSize: 25)
    }
    
    func configureResultImageView(view: UIView) {
        
        view.addSubview(resultImageView)
        
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.contentMode = .scaleAspectFit

        
    }
    
    func configureResultDescriptionLabel(view: UIView) {
                
        view.addSubview(resultDescriptionLabel)
        
        resultDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultDescriptionLabel.numberOfLines = 0
        resultDescriptionLabel.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    func configureResultReturnButton(view: UIView) {
                
        view.addSubview(resultReturnButton)
        
        resultReturnButton.translatesAutoresizingMaskIntoConstraints = false
        
        resultReturnButton.configuration = .filled()
        resultReturnButton.tintColor = .systemBlue
        
        resultReturnButton.setTitle("Search Again", for: .normal)
        
    }
    
    
}



// MARK: - Auto Layout Constraints
extension ResultViewAssistant {
    
    func resultTitleLabelConstraints(view: UIView) -> [NSLayoutConstraint] {
        
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
    
    
    func resultImageViewConstraints(view: UIView) -> [NSLayoutConstraint] {
        
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
    
    
    func resultDescriptionLabelConstraints(view: UIView) -> [NSLayoutConstraint] {
        
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
    
    
    func resultReturnButtonConstraints(view: UIView) -> [NSLayoutConstraint] {
        
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
