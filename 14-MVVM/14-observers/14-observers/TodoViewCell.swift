//
//  TodoViewCell.swift
//  14-observers
//
//  Created by Rave Bizz on 5/4/22.
//

import UIKit

class TodoViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var todoLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
