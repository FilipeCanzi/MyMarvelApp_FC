//
//  MarvelAPIManager.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 05/12/22.
//

import UIKit

protocol MarvelAPIManagerDelegate {
    
    func didFailWithError(err: Error?)
    func didReceiveCharacterData(_: MarvelAPIManager, data: MarvelCharacterObject)
    func didReceiveComicsData(_: MarvelAPIManager, data: MarvelComicsObject)
    
}


struct MarvelAPIManager {
    
    var delegate: MarvelAPIManagerDelegate?
    
    let urlManager = MarvelURLManager()
    
    func makeApplicationCall(with researchRequest: ResearchRequest) {
        
        let urlString = urlManager.urlText(researchRequest)
        
        performRequest(urlString: urlString, researchRequest: researchRequest)
        
        print(urlString)
        
    }

    
    func performRequest(urlString: String, researchRequest: ResearchRequest) {
        
        if let url = URL(string: urlString) {
            
            let session: URLSession = URLSession(configuration: .default)
            let task: URLSessionDataTask = session.dataTask(with: url) {
                data, response, error in
                
                if let error {
                    self.delegate?.didFailWithError(err: error)
                    return
                }
                
                if let data {
                    self.parseJSON(urlData: data, researchRequest: researchRequest)
                }
            }
            
            task.resume()
            
        }
    }
    

    
}


// MARK: - ParseJSON Methods

extension MarvelAPIManager {
    
    
    func parseJSON(urlData: Data, researchRequest: ResearchRequest) {
        
        switch researchRequest.marvelEntity {
            
        case .comics:
            comicsParseJSON(urlData: urlData)
        case .characters:
            characterParseJSON(urlData: urlData)
        }
    }
    
    
    func characterParseJSON(urlData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MarvelCharacterObject.self, from: urlData)
            
            let apiObject = MarvelCharacterObject(data: decodedData.data)
            
            print(apiObject)
            
            self.delegate?.didReceiveCharacterData(self, data: apiObject)
        }
        catch {
            self.delegate?.didFailWithError(err: error)
        }
    }
    
    
    func comicsParseJSON(urlData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MarvelComicsObject.self, from: urlData)
            
            let apiObject = MarvelComicsObject(data: decodedData.data)
            
            self.delegate?.didReceiveComicsData(self, data: apiObject)
        }
        catch {
            self.delegate?.didFailWithError(err: error)
        }
        
    }
    
    
}
