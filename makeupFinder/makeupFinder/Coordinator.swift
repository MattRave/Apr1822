//
//  Coordinator.swift
//  makeupFinder
//
//  Created by Rave Bizz on 4/28/22.
//

import Foundation
import UIKit

struct HomeCoordinator{
    func presentResults(viewController: ViewController, viewModel: HomeViewModel){
        let storyBoard = UIStoryboard(name: StringConstants.recentSBName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: StringConstants.recentSBID.rawValue) as! ProductsViewController
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.makeupModel = viewModel.modelToSend
        vc.titleText = StringConstants.searchResults.rawValue
        viewController.present(vc, animated: true, completion: nil)
    }
    func presentFavorites(viewController: ViewController){
        let storyBoard = UIStoryboard(name: StringConstants.recentSBName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier:StringConstants.recentSBID.rawValue) as! ProductsViewController
        vc.titleText = StringConstants.favorites.rawValue
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.setFavorites()
        viewController.present(vc, animated: true, completion: nil)
    }
    func presentCart(viewController: ViewController){
        let storyBoard = UIStoryboard(name: StringConstants.cart.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: StringConstants.cart.rawValue) as! CartViewController
        viewController.present(vc, animated: true, completion: nil)
    }
}
