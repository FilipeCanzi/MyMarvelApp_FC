//
//  MarvelObjectProtocol.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 07/12/22.
//

protocol MarvelObject: Decodable {
    
}


protocol MarvelContainer: Decodable {
    
    var offset: Int { get }
    var limit: Int { get }
    var total: Int { get }
    var count: Int { get }
    
}


protocol MarvelData: Decodable {
    
    var id: Int { get }
    var description: String { get }
    var thumbnail: MarvelObjectThumbnail { get }
    
}
