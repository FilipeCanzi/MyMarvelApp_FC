//
//  MarvelCharacterObject.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 05/12/22.
//

import Foundation

struct MarvelCharacterObject: Decodable {
    
    var data: MarvelCharacterContainer
    
}


struct MarvelCharacterContainer: Decodable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelCharacterData]
    
}


struct MarvelCharacterData: Decodable {
    
    let id: Int
    let description: String
    let thumbnail: MarvelObjectThumbnail
    
    let name: String
    
}
