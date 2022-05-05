//
//  ViewController.swift
//  14-observers
//
//  Created by Rave Bizz on 5/4/22.
//

import UIKit

class ViewController: UIViewController, TodoDelegate {
    
    
    
    @IBOutlet weak var randomTask: UIImageView!
    @IBOutlet weak var addNewPhoto: UIImageView!
    @IBOutlet weak var addNewLabel: UILabel!
    
    @IBOutlet weak var tableVIew: UITableView!
    var todoItems:[String] = []
    var setTodoItem: ((String, Bool, Int) -> Void)?
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        configureClickables()
//        configureDelegateFunc()
        setupObserver()
    }
    func setupObserver(){
        let name = Notification.Name(Constants.shared.notifactionKey)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: name, object: nil)
    }
    
    @objc func handleNotification(notifaction: Notification){
        let userInfo = notifaction.userInfo
        
        if let text = userInfo?["text"]! as? String,
           let isOld = userInfo?["isOld"]! as? Bool,
           let index = userInfo?["index"]! as? Int
        {
            
            if isOld{
                self.todoItems[index] = text
                self.tableVIew.reloadData()
                return
            }
            self.todoItems.append(text)
            self.tableVIew.reloadData()
        }
    }
    
    func configureTable(){
        tableVIew.delegate = self
        tableVIew.dataSource = self
        let nib =  UINib(nibName: "TodoViewCell", bundle: Bundle(for: TodoViewCell.self))
        tableVIew.register(nib, forCellReuseIdentifier: "TodoViewCell")
    }
    
    func configureDelegateFunc(){
        setTodoItem = {
            text, isOld, index in
            if isOld{
                self.todoItems[index] = text
                self.tableVIew.reloadData()
                return
            }
            self.todoItems.append(text)
            self.tableVIew.reloadData()
        }
    }

    
    func configureClickables(){
        addNewLabel.isUserInteractionEnabled = true
        addNewPhoto.isUserInteractionEnabled = true
        randomTask.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigateTo))
        let gestureRecognizerP = UITapGestureRecognizer(target: self, action: #selector(navigateTo))
        let gestureRecognizerR = UITapGestureRecognizer(target: self, action: #selector(getRandomTask))
        randomTask.addGestureRecognizer(gestureRecognizerR)
        addNewPhoto.addGestureRecognizer(gestureRecognizerP)
        addNewLabel.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func getRandomTask(){
        viewModel.getData(completion: {
            [unowned self] in
            if let  todoItem = self.viewModel.getCompleteString(){
                todoItems.append(todoItem)
                DispatchQueue.main.async {
                    self.tableVIew.reloadData()
                }
            }
        })
    }
    
    @objc func navigateTo(){
        let SB = UIStoryboard(name: "WriteTodoView", bundle: nil)
        if let vc = SB.instantiateViewController(withIdentifier: "WriteTodoViewController") as? WriteTodoViewController{
            vc.delegate = self
            navigationController?.show(vc, sender: nil)
        }    }
    
    
    
}

