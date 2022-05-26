//
//  NameViewController.swift
//  PropertyWrappers
//
//  Created by Rave Bizz on 5/26/22.
//

import UIKit

/// https://www.swiftbysundell.com/articles/property-wrappers-in-swift/

class NameViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func handleChange(_ sender: UITextField) {
        if let senderText = sender.text {
            name = senderText
            nameLabel.text = name
        }
    }
    
    @Uppercased var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
