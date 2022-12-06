//
//  MarvelComicsObject.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 05/12/22.
//

import Foundation

struct MarvelComicsObject: Decodable {
    
    let data: MarvelComicsContainer
    
}


struct MarvelComicsContainer: Decodable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelComicsData]
    
}


struct MarvelComicsData: Decodable {
    
    let id: Int
    let description: String
    let thumbnail: MarvelObjectThumbnail
    
    let title: String

}
