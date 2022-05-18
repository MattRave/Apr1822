//
//  ProductDetailsVM.swift
//  makeupFinder
//
//  Created by Rave Bizz on 4/8/22.
//

import Foundation
import UIKit

class ProductDetailViewModel{
    var makeupModel: MakeupModel?
    func getTitle() -> String?{
        makeupModel?.name
    }
    func getDescription() -> String?{
        makeupModel?.description
    }
    func getPrice() -> String?{
        makeupModel?.price?.formatToPrice()
    }
    func getRating() -> String{
        StringConstants.ratingPrefix.rawValue + "\(makeupModel?.rating ?? 0.0)" 
    }
    func getProducLink() -> String?{
        makeupModel?.product_link
    }
    func getProductType() -> String?{
        makeupModel?.product_type
    }
    func getPhoto() -> String?{
        return makeupModel?.image_link
    }
}
