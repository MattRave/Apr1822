//
//  CheckoutCoordinator.swift
//  makeupFinder
//
//  Created by Rave Bizz on 5/11/22.
//

import Foundation
import SwiftUI

struct checkoutCoordinator{
    func presentPayment(vc: UIViewController){
        let paymentView  = UIHostingController(rootView: SwiftUIView())
        vc.present(paymentView, animated: true, completion: nil)
    }
}

