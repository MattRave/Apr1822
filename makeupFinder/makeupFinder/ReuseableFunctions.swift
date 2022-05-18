//
//  ReuseableFunctions.swift
//  makeupFinder
//
//  Created by Rave Bizz on 4/8/22.
//

import Foundation
import UIKit

class ReuseableFunctions{
    static let shared = ReuseableFunctions()
    
    func configureNewView(with makeupModel:MakeupModel) -> ProductDetailViewController{
        let productdetailVM = ProductDetailViewModel()
        productdetailVM.makeupModel = makeupModel
        let storyBoard = UIStoryboard(name: StringConstants.productDetailsSBID.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: StringConstants.productDetailsID.rawValue) as! ProductDetailViewController
        vc.viewModel = productdetailVM
        return vc
    }
}
