//
//  AlbumCell.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import UIKit

class AlbumCell: UITableViewCell {

    @IBOutlet weak var artistname: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    var cellCount = count
    
    override func awakeFromNib() {
        super.awakeFromNib()
        count += 1
    }

    func configure(album: Album) {
        albumName.text = album.name
        artistname.text = album.artistName
        self.loadImage(imageUrl: album.imageUrl)
    }
    
    func loadImage(imageUrl: String) {
        ImageCache.shared.getImage(imageUrl: imageUrl) { image in
            DispatchQueue.main.async {
                self.albumImage.image = image
            }
        }
    }
}
