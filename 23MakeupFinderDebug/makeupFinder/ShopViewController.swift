//
//  ShopViewController.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    let viewModel = ShopViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    func configureTable(){
        tableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureButtons(){
        searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    }
    
    @objc func handleSearch(){
        if let text = searchField.text{
            viewModel.handleSearch(for: text, handleError: {
                self.handleError()
            }, completion: {
                self.presentResults()
            })
        }
    }
    
    func handleError(){
        let alert = UIAlertController()
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentResults(){
        ShopCoordinator().presentResults(viewController: self)
    }
}
