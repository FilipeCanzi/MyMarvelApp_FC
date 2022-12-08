//
//  MarvelCharacterObject.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 05/12/22.
//

import Foundation

struct MarvelCharacterObject: MarvelObject {   
    
    let data: MarvelCharacterContainer
    
}


struct MarvelCharacterContainer: MarvelContainer {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelCharacterData]
    
}


struct MarvelCharacterData: MarvelData {
    
    let id: Int
    let description: String
    let thumbnail: MarvelObjectThumbnail
    
    let name: String
    
}
