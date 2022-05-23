//
//  ViewController.swift
//  ProtocolNetworking
//
//  Created by Luat on 2/7/22.
//

import UIKit

class ViewController: UIViewController {

    typealias AlbumResult = Result<[MusicItem], NetworkRequestError>
    
    @IBOutlet weak var topAlbumLabel: UILabel!
    @IBOutlet weak var topAlbumArt: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTopAlbums()
    }
    
    func getTopAlbums() {
        let topAlbumRequest = TopAlbumRequest()
        topAlbumRequest.getAlbums { result in
            self.handleResult(result: result)
        }
    }
    
    func handleResult(result: AlbumResult) {
        switch result {
        case .success(let musicItems):
            let firstAlbum = musicItems[0]
            updateUI(musicItem: firstAlbum)
        case .failure(let error):
            print(error)
        }
    }
    
    func updateUI(musicItem: MusicItem) {
        DispatchQueue.main.async {
            self.topAlbumLabel.text = musicItem.name
        }
        self.getImage(str: musicItem.artworkUrl100)
    }
    
    func getImage(str: String?) {
        if let imageStr = str, let imageUrl = URL(string: imageStr) {
            let imageRequest = ImageRequest(url: imageUrl)
            imageRequest.startRequest { result in
                DispatchQueue.main.async {
                    self.topAlbumArt.image = result
                }
            }
        }
    }

}

