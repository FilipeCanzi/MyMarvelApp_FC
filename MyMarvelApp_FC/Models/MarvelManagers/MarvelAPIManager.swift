//
//  MarvelAPIManager.swift
//  MyMarvelApp_FC
//
//  Created by Filipe Rogério Canzi da Silva on 05/12/22.
//

import UIKit

protocol MarvelAPIManagerDelegate {
    
    func didFailWithError(err: Error?)
    func didReceiveData(_: MarvelAPIManager, data: MarvelObject, researchRequest: ResearchRequest)
    
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


// MARK: - ParseJSON Method

extension MarvelAPIManager {
    
    func parseJSON(urlData: Data, researchRequest: ResearchRequest) {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MarvelObject.self, from: urlData)
            
            let apiObject = MarvelObject(data: decodedData.data)
            
            self.delegate?.didReceiveData(self, data: apiObject, researchRequest: researchRequest)
        }
        catch {
            self.delegate?.didFailWithError(err: error)
        }
        
    }
    
}
