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
        
        if let publicKey = APIKey.publicKey, let privateKey = APIKey.privateKey {
            
            let preDigestedKey: String = timeStamp + privateKey + publicKey
            let digestedKey: String = encryptMD5(string: preDigestedKey)
            let urlKey = "ts=\(timeStamp)&apikey=\(publicKey)&hash=\(digestedKey)"
            
            return urlKey
            
        } else {
            
            print(
            "You Will Need a Public and Private Marvel API Key to be able to search for this content. You can make one for free at: https://developer.marvel.com/ . When you get one, go to MyMarvelApp_FC/Constants/APIKey.swift file and change the values with your API Keys.")
            
            return ""
            
        }
        
        
        
        
        
        
        
        
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
