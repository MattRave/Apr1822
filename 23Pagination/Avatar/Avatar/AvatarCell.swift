//
//  AvatarCell.swift
//  Avatar
//
//  Created by Luat on 6/6/21.
//

import UIKit

class AvatarCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var affiliationLabel: UILabel!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    func configure(model: Character) {
//        widthConstraint.constant = 100
        nameLabel.text = model.getName()
        affiliationLabel.text = model.getAffiliation()
        backgroundColor = model.getColor()
    }
}
