//
//  Ext_UIImageView.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 06/12/22.
//

/*
 
 Thanks to Paul Hudson for his amazing lessons!

 https://www.hackingwithswift.com/example-code/uikit/how-to-load-a-remote-image-url-into-uiimageview

 https://www.hackingwithswift.com/example-code/media/how-to-save-a-uiimage-to-a-file-using-jpegdata-and-pngdata
 
*/


import UIKit

extension UIImageView {
    
    func loadImageFromRemoteURL(urlString: String) {
        
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
    
    
    func loadImageFromLocalPath(imageName: String) {
        
        guard let picturesPath = AppDirectories.marvelPicturesPath else { return }
        
        let url: URL = picturesPath.appendingPathComponent(imageName + ".png")
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                self.image = image
            }
        }
        
    }
    

    func saveImage(imageName: String) {
        
        guard let image = self.image else { return }
        
        let picturesPath = AppDirectories.marvelPicturesPath
        
        if let picturesPath,
           let data = image.pngData() {
                let file = picturesPath.appendingPathComponent(imageName + ".png")
                try? data.write(to: file)
        }
    }
    
        
}
