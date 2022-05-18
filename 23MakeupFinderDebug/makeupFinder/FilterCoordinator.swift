//
//  FilterCoordinator.swift
//  makeupFinder
//
//  Created by Rave Bizz on 5/2/22.
//

import Foundation
import UIKit

struct FilterCoordinator{
    func presentResults(viewController: FilterViewController){
        let storyBoard = UIStoryboard(name: StringConstants.recentSBName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: StringConstants.recentSBID.rawValue) as! ProductsViewController
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.makeupModel = viewController.viewModel.makeupModel
        vc.titleText = StringConstants.searchResults.rawValue
        viewController.present(vc, animated: true, completion: nil)
    }
}
