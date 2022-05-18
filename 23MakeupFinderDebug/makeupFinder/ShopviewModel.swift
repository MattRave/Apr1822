//
//  ShopviewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class ShopViewModel{
    init(){
        setRecommended()
    }
    var recommendeds: [MakeupModel]?
    var modelToSend: [MakeupModel]?
    func handleSearch(for text: String, handleError: @escaping (()->Void), completion: @escaping () -> Void){
        APIManger.shared.constructUrl(withqueries: text.prepareForSearch(), searchErrorHandeler: handleError)
            APIManger.shared.getData(model: MakeupModel.self, completion: {
                model in
                self.modelToSend = model
                DispatchQueue.main.async {
                    completion()
                }
            })
        }
    
    func setRecommended(){
        if let query = Contstants.shared.brands.randomElement(){
            APIManger.shared.constructUrl(withqueries:[query])
            APIManger.shared.getData(model: MakeupModel.self, completion: {
                model in
                self.recommendeds = model
            })
        }
    }
    
    func addToFavorites(atIndex index: Int){
        if let model = recommendeds?[index] {
            DataManager.shared.addTofavorites(model: model)
        }
    }
    func addToCart(atIndex index: Int){
        if let model = recommendeds?[index]{
            DataManager.shared.addToCart(model: model)
        }
    }
}
