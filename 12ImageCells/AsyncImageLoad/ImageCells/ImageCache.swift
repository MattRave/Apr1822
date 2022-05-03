//
//  ImageCache.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import UIKit

let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"

class ImageCache {
    static let shared = ImageCache()
    let publicCache = NSCache<NSString, UIImage>()
    var pendingTasks: [String: URLSessionDataTask] = [:]
    
    func getAlbums(completion: @escaping ([Album]) -> Void) {
        guard let url = URL(string: musicStr) else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            
            guard
                let httpResonse = response as? HTTPURLResponse,
                httpResonse.statusCode == 200
            else {
                print("http status code error")
                return
            }
            do {
                let feed = try JSONDecoder().decode(Feed.self, from: data)
                let albums = feed.feed.results
                completion(albums)
            } catch {
                // decoding error
                print("parsing error")
                print(error)
            }
            
        }.resume()
        
    }
    
    func getImage(imageStr: String, completion: @escaping (UIImage?) -> Void) -> String? {
        let imageStr = imageStr.hiRes
        guard let url = URL(string: imageStr) else {
            print("invalid url")
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error \(error.debugDescription)")
                return
            }
            guard
                let httpResonse = response as? HTTPURLResponse,
                httpResonse.statusCode == 200
            else {
                print("http status code error")
                return
            }
            
            if let image = UIImage(data: data) {
                self.publicCache.setObject(image, forKey: imageStr as NSString)
                completion(image)
                self.pendingTasks.removeValue(forKey: imageStr)
            } else {
                print("no image data")
                completion(nil)
            }
            
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            task.resume()
        }
        
        pendingTasks[imageStr] = task

        return imageStr
    }
}

