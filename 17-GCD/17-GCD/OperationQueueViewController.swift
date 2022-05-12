//
//  OperationQueueViewController.swift
//  17-GCD
//
//  Created by Rave Bizz on 5/10/22.
//

import UIKit

class OperationQueueViewController: UIViewController {
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    func fetchData(){
        let operationQeue = OperationQueue()
        let operation = BlockOperation()
        let operation2 = BlockOperation()
        let delayedOperation = BlockOperation()
        operation.addExecutionBlock {
            [unowned self] in
            self.viewModel.fetchDogPhoto {
                print("task1")
                
            }
        }
        operation2.addExecutionBlock {
            self.viewModel.fetchActivity {
                print("task2")
            }
        }
        delayedOperation.addExecutionBlock {
            self.viewModel.fetchColor{
                print("task3")
            }
        }
        operation.completionBlock = {
            operationQeue.addOperation(delayedOperation)
        }
        operationQeue.addOperation(operation)
        operationQeue.addOperation(operation2)
        
    }
    

 

}
