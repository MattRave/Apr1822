//
//  CartViewModel.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class CartViewModel{
    var cart: [MakeupModel]?
    init(){
        getCart()
    }
    
    func getCart(){
        cart = DataManager.shared.getData(for: StringConstants.cartPath.rawValue)
    }
    
    func getTotal() -> String{
        var tottal = 0.0
        if let cart = cart {
            for makeup in cart{
                if let price = makeup.price{
                    tottal += Double(price) ?? 0.0
                }
            }
        }
        return "\(tottal)".formatToPrice()
    }
    
    func addToFavorites(atIndex index: Int){
        if let model = cart?[index] {
            DataManager.shared.addTofavorites(model: model)
        }
    }
}
