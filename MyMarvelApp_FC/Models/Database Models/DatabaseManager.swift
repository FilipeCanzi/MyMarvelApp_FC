//
//  DatabaseManager.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 08/01/23.
//

import UIKit
import CoreData

struct DatabaseManager {
    
    static let containerName: String = "MarvelAppDatabase"
    
    static let appContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    static func saveNewData(data: MarvelData, entity: MarvelEntity) {
                
        switch entity {
        
        case .comics:
            let comics = MarvelComicsData(context: self.appContext)
            comics.comicsID = Int64(data.id)
            comics.comicsTitle = data.title
            comics.comicsDescription = data.description
            comics.comicsImageName = getImageName(data: data, entity: .comics)
            comics.isFavorite = false
            
        case .characters:
            let character = MarvelCharacterData(context: self.appContext)
            character.characterID = Int64(data.id)
            character.characterName = data.name
            character.characterDescription = data.description
            character.characterImageName = getImageName(data: data, entity: .characters)
            character.isFavorite = false
            
        }
        
        saveContext()
        
    }
    
    static func saveContext() {
        do {
            try self.appContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    
    static func getImageName(data: MarvelData, entity: MarvelEntity) -> String {
        
        var imageName: String = ""
        
        switch entity {
        case .comics:
            if let comicsTitle = data.title {
                imageName = "Comics - " + comicsTitle
            }
        case .characters:
            if let characterName = data.name {
                imageName = "Character - " + characterName
            }
        }
        
        return imageName
        
    }
    
    
    
}
