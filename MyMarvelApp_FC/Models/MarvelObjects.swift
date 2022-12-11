//
//  MarvelAPIObject.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 10/12/22.
//

import Foundation

struct MarvelObject: Decodable {
    
    let data: MarvelContainer
    
}


struct MarvelContainer: Decodable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelData]
    
}


struct MarvelData: Decodable {
    
    let id: Int
    let description: String
    let thumbnail: MarvelObjectThumbnail
    
    let name: String?
    let title: String?
    
}


struct MarvelObjectThumbnail: Decodable {
    
    var path: String = ""
    var `extension`: String = ""
    
}
