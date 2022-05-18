//
//  Character.swift
//  Avatar
//
//  Created by Luat on 6/6/21.
//

import UIKit

struct Character: Codable {
    let _id: String?
    let enemies: [String]?
    let photoUrl: String?
    let name: String?
    let affiliation: String?
    
    func getName() -> String {
        return name ?? "No name"
    }
    
    func getAffiliation() -> String {
        return affiliation ?? "No Affiliation"
    }
    
    func getColor() -> UIColor? {
        if let affiliation = affiliation?.lowercased() {
            let color = NationColors.mapping.first { affiliation.contains($0.key)}?.value
            return color
        } else {
            return .black
        }
    }
}
