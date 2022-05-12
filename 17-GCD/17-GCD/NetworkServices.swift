//
//  NetworkServices.swift
//  17-GCD
//
//  Created by Rave Bizz on 5/10/22.
//

import Foundation
import UIKit
class APIManger{
    
    static let shared = APIManger()
        enum Endpoint: String{
        case dog = "https://random.dog/woof.json"
        case color = "https://www.thecolorapi.com/scheme?hex=24B1E0&mode=quad&count=20"
        case bored = "https://www.boredapi.com/api/activity/"
    }
    
    
    func getData<genericModel: Decodable>(model: genericModel.Type, url: Endpoint , completion: @escaping (genericModel) -> Void){
        guard let url = URL(string: url.rawValue) else {
            print("no url")
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: {
            data, response, error in
            guard let data = data else{
                print("no data")
                return
            }
            
            do {
                let model = try JSONDecoder().decode(genericModel.self, from: data)
                completion(model)
            } catch  {
                print(error, url)
            }
        }).resume()
    }
}
