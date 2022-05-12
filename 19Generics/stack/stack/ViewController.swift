//
//  ViewController.swift
//  stack
//
//  Created by Luat on 5/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var stackItems: UILabel!
    var stack = Stack<Animal>() {
        didSet {
            stackItems.text = stack.description
        }
    }

    
    @IBAction func handlePush(_ sender: Any) {
        stack.push(Animal(name:inputTextField.text ?? ""))
    }
    @IBAction func handlePop(_ sender: Any) {
        let result = stack.pop()
        resultLabel.text = result.name
    }
    @IBAction func handleEmpty(_ sender: Any) {
        stack.clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

struct Animal {
    let name: String
}
