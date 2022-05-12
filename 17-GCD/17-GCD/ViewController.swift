//
//  ViewController.swift
//  17-GCD
//
//  Created by Rave Bizz on 5/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}



class GDCDemo{
    func demo(){
    let queue = DispatchQueue(label: "queue", attributes: .concurrent)
    queue.async {
        print("task 1 start")
        print("task 1 end")
    }
    queue.async {
        print("task 2 start")
        print("task 2 end")
    }
    
    let dispatchGroup = DispatchGroup()
    
    for _ in 0...5{
        dispatchGroup.enter()
        //call api the five apis
        dispatchGroup.leave()
    }
    dispatchGroup.notify(queue: .main, execute: {
        //update UI
    })
    //GCD grand central dispatch
    let operationQueue = OperationQueue()
    operationQueue.maxConcurrentOperationCount = 30
    
    operationQueue.addOperation {
        //ma
    }
    
    let opertaion = Operation()
    let opertaion2 = Operation()
    operationQueue.addOperation(opertaion)
    if opertaion.isFinished {
        operationQueue.addOperation(opertaion2)
    }

    //race condition
    }
}
