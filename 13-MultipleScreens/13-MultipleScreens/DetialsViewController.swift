//
//  DetialsViewController.swift
//  13-MultipleScreens
//
//  Created by Rave Bizz on 5/4/22.
//

import UIKit

class DetialsViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = labelText!
        
        // setting up label to be clickable
        myLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAction))
        myLabel.addGestureRecognizer(tapGesture)
    }
    @objc func handleAction(){
        view.backgroundColor = .blue
    }

}


class ActionHandler{
    @objc func handleAction(){
        print("asasda")
    }
}
