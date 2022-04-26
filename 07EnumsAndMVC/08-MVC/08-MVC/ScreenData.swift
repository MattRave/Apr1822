//
//  ScreenData.swift
//  08-MVC
//
//  Created by Rave Bizz on 4/25/22.
//

import Foundation

struct ScreenData{
    let color: String
    let text: String
    let photo: String
}

enum Photo: String, CaseIterable{
    case cloud = "cloud.fill"
    case moon = "moon.fill"
    case flame = "flame.fill"
    case water = "drop.fill"
}
