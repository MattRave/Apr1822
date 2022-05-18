//
//  Color+NewColors.swift
//  makeupFinder
//
//  Created by Rave Bizz on 5/2/22.
//

import Foundation
import UIKit

extension UIColor{
    static var background: UIColor{
        if let color =  UIColor(named: "background")
        {
            return color
        }
        return .purple
    }
}
