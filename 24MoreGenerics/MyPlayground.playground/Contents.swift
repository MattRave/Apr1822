import UIKit

/// Generic Funciton
func myConcat<T>(first: T, second: T) -> [T] {
    return [first, second]
}

let myValue = myConcat(first: "asdf", second: "opwieqr")
let myInts = myConcat(first: 1, second: 200)


/// Generic function with completion closure
var num: Int = 0
var name: String = ""
func start<T>(completion: (T) -> Void) {
}

start { result in
    num = result
}

start { result in
    name = result
}

/// Networking function with Generic Decoding
func fetchData<T: Decodable>(str: String, completion: @escaping (T) -> Void) {
    guard let url = URL(string: str) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            return
        }
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            completion(decoded)
        } catch {}
    }.resume()
}


struct Music: Decodable {
    let musicName: String
}
struct Drink: Decodable {
    let drinkName: String
}

var myMusic: Music?
var myDrink: Drink?

fetchData(str: "asdf") { decoded in
    myMusic = decoded
}
fetchData(str: "zxcv") { decoded in
    myDrink = decoded
}

/// Generic Protocol to Decode into Placeholder ModelType
protocol DecodableResource {
    associatedtype ModelType: Decodable
    var url: URL { get }
}

struct MusicResource: DecodableResource {
    typealias ModelType = Music
    var url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json")!
    
    func decode(data: Data) {
        let decoded = try? JSONDecoder().decode(ModelType.self, from: data)
        print(decoded?.musicName ?? "")
    }
}
