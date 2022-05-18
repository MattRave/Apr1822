//
//  ProductsViewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class ProductsViewModel{
    var makeupModel: [MakeupModel]?
    
    func addToFavorites(atIndex index: Int){
        if let model = makeupModel?[index] {
            DataManager.shared.addTofavorites(model: model)
        }
    }
    
    func addToCart(atIndex index: Int){
        if let model = makeupModel?[index]{
            DataManager.shared.addToCart(model: model)
        }
    }
    
    func setFavorites(){
        self.makeupModel = DataManager.shared.getData(for: StringConstants.favoritePath.rawValue)
    }
}
