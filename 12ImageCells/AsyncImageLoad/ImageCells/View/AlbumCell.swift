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
    
    var onReuse: () -> Void = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(album: Album) {
        albumName.text = album.name
        artistname.text = album.artistName

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        onReuse()
        albumImage?.image = nil
    }

}
