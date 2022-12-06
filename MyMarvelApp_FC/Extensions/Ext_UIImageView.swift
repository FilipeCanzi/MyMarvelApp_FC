//
//  Ext_UIImageView.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 06/12/22.
//

/*
 
 Thanks to Paul Hudson for his amazing lessons!

 https://www.hackingwithswift.com/example-code/uikit/how-to-load-a-remote-image-url-into-uiimageview

*/


import UIKit

extension UIImageView {
    
    func loadImageFromURL(urlString: String) {
        
        if let url: URL = URL(string: urlString) {
            
            DispatchQueue.global().async { [weak self] in
                
                if let data = try? Data(contentsOf: url) {
                    
                    if let image = UIImage(data: data) {
                        
                        DispatchQueue.main.async {
                            self?.image = image                            
                        }
                    }
                }
            }
        }
    }
        
}
