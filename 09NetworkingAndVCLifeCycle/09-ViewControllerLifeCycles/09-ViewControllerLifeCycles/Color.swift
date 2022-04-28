//
//  Color.swift
//  09-ViewControllerLifeCycles
//
//  Created by Rave Bizz on 4/27/22.
//
import UIKit
import Foundation

enum Color: String, CaseIterable{
    case Color = "Color"
    case Color1 = "Color-1"
    case Color2 = "Color-2"
    case Color3 = "Color-3"
    case Color4 = "Color-4"
    case Color5 = "Color-5"
    case Color6 = "Color-6"
    case Color7 = "Color-7"
    case Color8 = "Color-8"
    case Color9 = "Color-9"
    case Color10 = "Color-10"
}

let ColorDict = [
    Color.Color : UIColor(named: Color.Color.rawValue),
    Color.Color1 : UIColor(named: Color.Color1.rawValue),
    Color.Color2 : UIColor(named: Color.Color2.rawValue),
    Color.Color3 : UIColor(named: Color.Color3.rawValue),
    Color.Color4 : UIColor(named: Color.Color4.rawValue),
    Color.Color5 : UIColor(named: Color.Color5.rawValue),
    Color.Color6 : UIColor(named: Color.Color6.rawValue),
    Color.Color7 : UIColor(named: Color.Color7.rawValue),
    Color.Color8 : UIColor(named: Color.Color8.rawValue),
    Color.Color9 : UIColor(named: Color.Color9.rawValue),
    Color.Color10 : UIColor(named: Color.Color10.rawValue),
]
