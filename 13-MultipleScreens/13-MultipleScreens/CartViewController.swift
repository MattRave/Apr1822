//
//  CartViewController.swift
//  13-MultipleScreens
//
//  Created by Rave Bizz on 5/4/22.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableVIew.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    }
    
    
    

    @IBOutlet weak var tableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableVIew.register(nib, forCellReuseIdentifier: "myCell")   
        tableVIew.delegate = self
        tableVIew.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell{
            cell.myLabel.text = "yes"
            cell.contentView.backgroundColor = .yellow
        }
        
        
        let SB = UIStoryboard.init(name: "DetailView", bundle: nil)
        if let vc = SB.instantiateViewController(withIdentifier: "Detail") as? DetialsViewController, let navController = self.navigationController
        {
            vc.labelText = "Hello"
            navController.show(vc, sender: nil)
        }
    }

}
