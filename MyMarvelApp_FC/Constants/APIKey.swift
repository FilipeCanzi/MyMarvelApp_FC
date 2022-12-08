//
//  APIKey.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 04/12/22.
//

import Foundation

struct APIKey {
    
    static let publicKey: String? = Bundle.main.object(forInfoDictionaryKey: "Public Api Key") as? String

    static let privateKey: String? = Bundle.main.object(forInfoDictionaryKey: "Private Api Key") as? String
    
}
