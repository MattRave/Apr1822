//
//  Model.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import Foundation

struct Feed: Decodable {
    let feed: FeedItem
}

struct FeedItem: Decodable {
    let title: String
    let results: [Album]
}

struct Album: Decodable {
    enum CodingKeys: String, CodingKey {
        case artistName, name
        case imageUrl = "artworkUrl100"
    }
    let artistName: String
    let name: String
    let imageUrl: String
}
