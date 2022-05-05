//
//  APIManager.swift
//  14-observers
//
//  Created by Rave Bizz on 5/5/22.
//

import Foundation


class APIManager{
    static let shared = APIManager()
    let url = "https://www.boredapi.com/api/activity/"
    func getData(completion: @escaping (BoredRespose) -> Void){
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url, completionHandler: {
                data, response, error in
                if let data = data{
                    do {
                        let decodedData =    try JSONDecoder().decode(BoredRespose.self, from: data)
                        completion(decodedData)
                    } catch {
                        print(error)
                    }
                }
            }).resume()
            
        }
    }
}
