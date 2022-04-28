//
//  Activitiy.swift
//  Networking
//
//  Created by Rave Bizz on 4/28/22.
//

import Foundation

struct Activity: Decodable{
    let activity: String?
    let type: String?
    let friends: Int?
    let link: String?
    let accessibility: Float?
    
    enum CodingKeys: String, CodingKey{
        case activity
        case type
        case friends = "participants"
        case link
        case accessibility
    }
}


 // Repsonse.data[0].images.jpg.imagurl
struct Repsonse: Decodable{
    let data: [Data]
}

struct Data: Decodable {
    let images: Images
}

struct Images: Decodable{
    let jpg: Jpg
}

struct Jpg: Decodable{
    let imageUrl: String
}
