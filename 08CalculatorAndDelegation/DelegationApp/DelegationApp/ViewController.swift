//
//  ViewController.swift
//  DelegationApp
//
//  Created by Rave Bizz on 4/27/22.
//

import UIKit

protocol InputHandler {
    var data: String? { get set }
    var input: Int? { get set }
    func changeBackground(input: String)
}

class ViewController: UIViewController, InputHandler {

    var data: String?
    var input: Int?
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First VC"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue called")
        let secondVC = segue.destination as? SecondViewController
        secondVC?.data = inputField.text
        secondVC?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataLabel.text = data
    }
    
    func changeBackground(input: String) {
        if input == "blue" {
            view.backgroundColor = .blue
        } else {
            view.backgroundColor = .red
        }
    }
}

