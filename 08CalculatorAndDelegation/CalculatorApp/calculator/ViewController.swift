//
//  ViewController.swift
//  calculator
//
//  Created by Rave Bizz on 4/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBAction func numClicked(_ sender: UIButton) {
        displayLabel.text = sender.titleLabel?.text
        if isPendingOperation {
            if let value = sender.titleLabel?.text, let intValue = Int(value) {
                secondNum = intValue
                print("saving second number \(secondNum)")
            }
        } else if let value = sender.titleLabel?.text, let intValue = Int(value) {
            firstNum = intValue
            print("saving first number \(firstNum)")
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        print(sender.titleLabel?.text)
        currentOperation = sender.titleLabel?.text
        
    }
    
    @IBAction func equalClicked(_ sender: UIButton) {
        performOperation()
        currentOperation = nil
    }
    
    var displayStr: String = "Display" {
        didSet {
            displayLabel.text = displayStr
        }
    }
    var firstNum: Int = 0
    var secondNum: Int = 0
    var currentOperation: String? = nil
    var isPendingOperation: Bool {
        return currentOperation != nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func performOperation() {
        
        // two number operation: int + int
        var operation: ((Int, Int) -> Int)?
        if currentOperation == "+" {
            operation = { $0 + $1 }
        } else if currentOperation == "-" {
            operation = { $0 - $1 }
        }
        
        let result = operation?(firstNum, secondNum)
        // add(first: firstNum, second: secondNum)
        
        // update display
        if let result = result {
            displayStr = String(result)
        } else {
            displayStr = "No operation done"
        }
        
        // one number operation: sqrt(int), equals
    }
    
//    func updateDisplay(_ value: Int) {
//        displayLabel.text = String(value)
//    }

}

