//
//  Viewcontroller+Delgate&DataSource.swift
//  14-observers
//
//  Created by Rave Bizz on 5/4/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TodoViewCell", for: indexPath) as? TodoViewCell {
            cell.todoLabel.text = todoItems[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SB = UIStoryboard(name: "WriteTodoView", bundle: nil)
        if let vc = SB.instantiateViewController(withIdentifier: "WriteTodoViewController") as? WriteTodoViewController{
//            vc.delegate = self
            vc.todoText = todoItems[indexPath.row]
            vc.isOld = true
            vc.index = indexPath.row
            navigationController?.show(vc, sender: nil)
        }
            
    }
}
