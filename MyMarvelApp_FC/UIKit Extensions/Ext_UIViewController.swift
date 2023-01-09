//
//  ViewController_Ext_removeAndAddAllSubviews.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 17/12/22.
//

import UIKit

extension UIViewController {
    
    func removeAndAddAllSubviews(view: UIView) {
        for subview in view.subviews {
            subview.removeFromSuperview()
            view.addSubview(subview)
        }
    }
    
    
}
