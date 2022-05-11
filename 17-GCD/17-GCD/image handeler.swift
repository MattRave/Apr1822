//
//  image handeler.swift
//  17-GCD
//
//  Created by Rave Bizz on 5/11/22.
//
import UIKit
import Foundation
extension UIImageView{
    func getImage(for url: URL, callback: (()-> Void)? = nil){
        if let cachedImage = ImageCacheManager.shared.imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
                   self.image = cachedImage
               } else {
                   URLSession.shared.dataTask(with: url) { data, response, error in
                       guard let data = data, error == nil else { return }
                       DispatchQueue.main.async {
                           if let imageToCache = UIImage(data: data){
                               ImageCacheManager.shared.imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
                               self.image = imageToCache
                               callback?()
                           }
                       }
                   }.resume()
               }
           }
    }
final class ImageCacheManager{
    static let shared = ImageCacheManager()
    let imageCache = NSCache<NSString, AnyObject>()
}
