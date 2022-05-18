//
//  ImageCacheManager.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation
import UIKit

final class ImageCacheManager{
    static let shared = ImageCacheManager()
    let imageCache = NSCache<NSString, AnyObject>()
}
