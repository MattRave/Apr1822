//
//  Models.swift
//  17-GCD
//
//  Created by Rave Bizz on 5/10/22.
//

import Foundation
struct ColorModel: Decodable{
    let colors: [Color]
}
struct Color: Decodable{
    let name: Name
    let rgb: RBG
}
struct RBG: Decodable{
    let r: Int
    let b: Int
    let g: Int
}
struct Name: Decodable{
    let value: String
}
struct DogModel: Decodable{
    let url: String
}
struct BoredModel: Decodable{
    let activity: String
}
