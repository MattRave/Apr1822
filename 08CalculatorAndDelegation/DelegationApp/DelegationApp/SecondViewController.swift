//
//  SecondViewController.swift
//  DelegationApp
//
//  Created by Rave Bizz on 4/27/22.
//

import UIKit

class SecondViewController: UIViewController {

    var data: String?
    var delegate: InputHandler?
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var dataLabel: UILabel!
    @IBAction func handleSave(_ sender: Any) {
//        let vc = navigationController?.viewControllers[0] as? ViewController
//        print(vc)
        
        delegate?.data = inputField.text
        delegate?.input = 10
        delegate?.changeBackground(input: inputField.text ?? "")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second VC"
        print("viewDidLoad second VC")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataLabel.text = data
    }

    deinit {
        print("removing from memory")
    }
}
