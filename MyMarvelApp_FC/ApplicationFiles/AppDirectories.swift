//
//  AppDirectories.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 06/01/23.
//
// Special thanks to Abdelahad Darwish:
// https://stackoverflow.com/questions/50405920/how-check-directory-exist
//

import Foundation

struct AppDirectories {
    
    static let picturesDirectoryName: String = "MarvelAppPictures"
    
    static var marvelPicturesPath: URL?
    
    static func verifyMarvelAppDirectories() {
        self.verifyMarvelPicturesDirectory()
    }
    
    
    static func verifyMarvelPicturesDirectory() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let directory = paths[0]
        let fileManager = FileManager.default

        let url = URL(fileURLWithPath: directory).appendingPathComponent(picturesDirectoryName)

        if fileManager.fileExists(atPath: url.path) == false {
            do {
                try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                self.marvelPicturesPath = url
            }
            catch {
                print("Error: Unable to create directory: \(error)")
            }
        }
        else {
            self.marvelPicturesPath = url
        }
        
    }
    
}
