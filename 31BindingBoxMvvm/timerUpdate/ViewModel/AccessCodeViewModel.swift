//
//  AccessCodeViewModel.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import Foundation
import UIKit

class AccessCodeViewModel {
    
    private var accessCodeNetwork = NetworkManager()
    
/// Method 1: ViewModel holds the binding closure
/// - model's data is passed to the closure (closure is set by VC)

//    private var update: ((String?) -> ())?
//    private var accessCodeModel: AccessCodeModel? {
//        didSet {
//            update?(accessCodeModel?.getAccessCodeAndPin())
//        }
//    }
//
//    func fetchCode() {
//        accessCodeNetwork.cycleCodeOnRepeat { model in
//            print("Access code: \(model.getAccessCodeAndPin())")
//            self.accessCodeModel = model
//        }
//    }
//
//    func bind(update: @escaping (String?) -> Void) {
//        print("Using ViewModel binding")
//        self.update = update
//    }
    
/// Method 2: A "Box" with a generic "Value" holds the binding closure
/// - model's data is passed to the closure (closure is set by VC)
    
    var accessCodeBox: Box<String?> = Box(nil)

    func fetchCode() {
        accessCodeNetwork.cycleCodeOnRepeat { model in
            print("Access code: \(model.getAccessCodeAndPin())")
            self.accessCodeBox.value = model.getAccessCodeAndPin()
        }
    }

    func bind(listener: @escaping (String?) -> Void) {
        print("Using Binding Box Method")
        accessCodeBox.bind(listener: listener)
    }

}
