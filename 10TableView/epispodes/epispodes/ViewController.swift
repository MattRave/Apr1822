//
//  ViewController.swift
//  epispodes
//
//  Created by Rave Bizz on 4/29/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var episodes = [
        "first",
        "second"
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = .yellow
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = "\(episode)"
        
//        var config = cell.defaultContentConfiguration()
//        config.text = "testing \(indexPath.section) \(indexPath.row)"
        
//        var bgConfig = cell.backgroundConfiguration
//        bgConfig?.backgroundColor = .yellow
        
//        cell.backgroundConfiguration = bgConfig
//        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapping cell \(indexPath.section) \(indexPath.row)")
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    }


}

