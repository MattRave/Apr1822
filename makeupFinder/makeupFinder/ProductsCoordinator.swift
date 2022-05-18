//
//  ProductsCoordinator.swift
//  makeupFinder
//
//  Created by Rave Bizz on 5/2/22.
//

import Foundation
import UIKit

struct ProductCoordinator{
    func presentFavorites(viewController: ProductsViewController){
        let storyBoard = UIStoryboard(name: StringConstants.recentSBName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier:StringConstants.recentSBID.rawValue) as! ProductsViewController
        vc.titleText = StringConstants.favorites.rawValue
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.setFavorites()
        viewController.present(vc, animated: true, completion: nil)
    }
    
    func presentCart(viewController: ProductsViewController){
        let storyBoard = UIStoryboard(name: StringConstants.cart.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier:StringConstants.cart.rawValue) as! CartViewController
        viewController.present(vc, animated: true, completion: nil)
    }
}
