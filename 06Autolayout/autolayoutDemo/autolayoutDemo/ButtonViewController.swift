//
//  ButtonViewController.swift
//  autolayoutDemo
//
//  Created by Rave Bizz on 4/25/22.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var printButton: UIButton!
    
    @IBAction func printButtonClicked(_ sender: UIButton) {
        print("button cliked")
        sender.backgroundColor = .red
        sender.removeFromSuperview()
        sender.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("buttonViewController did Load")
        printButton.setTitle("New Print Button", for: .normal)
    }


}
