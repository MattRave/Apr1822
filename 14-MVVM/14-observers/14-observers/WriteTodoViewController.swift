//
//  WriteTodoViewController.swift
//  14-observers
//
//  Created by Rave Bizz on 5/4/22.
//

import UIKit





//let notifactionKey = "co.demo.DidEdit"

class WriteTodoViewController: UIViewController {
    var delegate: TodoDelegate?
    @IBAction func saveButton(_ sender: Any) {
        
        guard let text = todoTextField.text else {
            return
        }
        let userInfo = ["text": text,
                        "isOld": isOld,
                        "index": index] as [String : Any]
        let name = Notification.Name(Constants.shared.notifactionKey)
        NotificationCenter.default.post(name: name, object: nil, userInfo: userInfo )
        navigateBack()
//        if let text = todoTextField.text{
//            delegate?.setTodoItem?(text, isOld, index)
//
//        }
    }
    
    @IBOutlet weak var todoTextField: UITextView!
    var isOld = false
    var index  = 0
    
    var todoText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTextField.text = todoText
    }

    func navigateBack(){
        navigationController?.popViewController(animated: true)
    }


}
