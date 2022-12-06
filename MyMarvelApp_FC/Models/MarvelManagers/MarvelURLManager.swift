//
//  MarvelURLManager.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 06/12/22.
//

import UIKit
import CryptoKit

struct MarvelURLManager {
    
    
    let baseURL: String = "http://gateway.marvel.com/v1/public/"
    
    
    func encryptMD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    
    func urlText(_ researchRequest: ResearchRequest) -> String {
        
        let requestParameter = URLRequestParameter(researchRequest)
        let keyParameter = URLKeyParameter()

        let urlText = baseURL + requestParameter + keyParameter
        return urlText
        
    }
    
    
    func URLKeyParameter() -> String {
        
        let timeStamp = String(format: "%.0f", Date().timeIntervalSince1970)
        
        let preDigestedKey: String = timeStamp + APIKey.privateKey + APIKey.publicKey
        let digestedKey: String = encryptMD5(string: preDigestedKey)
        
        let urlKey = "ts=\(timeStamp)&apikey=\(APIKey.publicKey)&hash=\(digestedKey)"
        
        return urlKey
        
    }
    
    
    func URLRequestParameter(_ researchRequest: ResearchRequest) -> String {
        
        let marvelEntity: String = researchRequest.marvelEntity.rawValue
        let marvelAttribute: String = researchRequest.marvelAttribute.rawValue
        
        let rawUserText: String = researchRequest.userText
        let preppedUserText: String = preppedTextForURL(rawUserText)
        
        return "\(marvelEntity)?\(marvelAttribute)=\(preppedUserText)&"
    }
    
    
    func preppedTextForURL(_ text: String) -> String {
        
        var textArray: [String] = Array(text).map { String ($0) }

        for i in 0..<textArray.count {
            
            if textArray[i] == " " {
                textArray[i] = "%20"
            }
            
        }
        
        return textArray.joined()
        
    }
    
}
