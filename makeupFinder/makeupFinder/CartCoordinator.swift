//
//  CartCoordinator.swift
//  makeupFinder
//
//  Created by Rave Bizz on 5/2/22.
//

import Foundation
import UIKit

struct CartCoordinator{
    func presentFavorite(viewController: CartViewController){
        let storyBoard = UIStoryboard(name: StringConstants.recentSBName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier:StringConstants.recentSBID.rawValue) as! ProductsViewController
        vc.titleText = StringConstants.favorites.rawValue
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.setFavorites()
        viewController.present(vc, animated: true, completion: nil)
    }
    func presentCheckout(viewController: CartViewController){
        let vc: CheckoutViewController = .init()
        viewController.present(vc, animated: true, completion: nil)
    }
    
}
