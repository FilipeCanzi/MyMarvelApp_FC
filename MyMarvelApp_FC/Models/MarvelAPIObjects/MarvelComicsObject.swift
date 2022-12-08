//
//  MarvelComicsObject.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 05/12/22.
//

import Foundation

struct MarvelComicsObject: MarvelObject {
    
    let data: MarvelComicsContainer
    
}


struct MarvelComicsContainer: MarvelContainer {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelComicsData]
    
}


struct MarvelComicsData: MarvelData {
    
    let id: Int
    let description: String
    let thumbnail: MarvelObjectThumbnail
    
    let title: String

}
