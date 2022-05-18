//
//  productPhotoCell.swift
//  makeupFinder
//
//  Created by Rave Bizz on 4/21/22.
//

import UIKit

class ProductPhotoCell: UITableViewCell {
    @IBOutlet weak var makeupImage: UIImageView!
    var imageUrl: String?{
        didSet{
            if let url = imageUrl{
                makeupImage.getImage(for: url, callback: {
                    image in
                    if url == self.imageUrl{
                        self.makeupImage.image = image
                    }
                    else{
                        self.makeupImage.image = UIImage(named: "loading")
                    }
                })
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var refresh: (() -> Void)?
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
