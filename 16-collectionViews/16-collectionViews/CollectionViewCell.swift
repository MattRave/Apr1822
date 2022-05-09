//
//  CollectionViewCell.swift
//  16-collectionViews
//
//  Created by Rave Bizz on 5/9/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with image: UIImage){
        imageView.image = image
    }
    static let idenifier = "collectionCell"
    static func getNib() -> UINib{
        UINib(nibName: "CollectionViewCell", bundle: nil)
    }
}
