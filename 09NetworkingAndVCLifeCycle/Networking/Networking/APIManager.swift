//
//  APIManager.swift
//  Networking
//
//  Created by Rave Bizz on 4/28/22.
//

import Foundation
/*
swift multi-threaded
 3 threads
 main = UI events user ineraction
 global = fetching data
 custom = must be created
 */
class APIManger {
   static let shared = APIManger()
    let urlString = "https://www.boredapi.com/api/activity/"
    
    func getData(callBack: @escaping (Activity) -> Void ){
        
        
        if let url = URL(string: urlString){
            let task = URLSession.shared.dataTask(with: url, completionHandler: {
                data, response , error in
                print("fetch complete")
                if let data = data {
                    do {
                      let result = try JSONDecoder().decode(Activity.self, from: data)
                        callBack(result)
                    } catch  {
                        print(error)
                    }
                }
            })
            task.resume()
        }
        print("getdata function is finished")
    }
}
