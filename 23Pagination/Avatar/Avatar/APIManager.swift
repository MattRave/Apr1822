//
//  WebService.swift
//  Avatar
//
//  Created by Luat on 6/6/21.
//

import Foundation

protocol AvatarAPIManager {
    var avartarUrl: URL { get }
    func getModelsAt(page: Int, completion: @escaping (Data?) -> Void)
    func makeRequest(to url: URL, completion: @escaping (Data?) -> Void)
    func addPageQueryToUrl(from url: URL, pageNum: Int) -> URL
}

class ConcreteAPIManager: AvatarAPIManager {
    var avartarUrl = URL(string: "https://last-airbender-api.herokuapp.com/api/v1/characters")!
    
    func getModelsAt(page: Int, completion: @escaping (Data?) -> Void) {
        let urlForPage = addPageQueryToUrl(from: avartarUrl, pageNum: page)
        makeRequest(to: urlForPage, completion: completion)
    }
    
    func makeRequest(to url: URL, completion: @escaping (Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data)
        }.resume()
    }
    
    /// adds query string: "?page=Int" to base url
    func addPageQueryToUrl(from url: URL, pageNum: Int) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let pageQuery = URLQueryItem(name: "page", value: "\(pageNum)")
        components?.queryItems = [pageQuery]
        guard let queryURL = components?.url else { return url }
        return queryURL
    }
    
}
