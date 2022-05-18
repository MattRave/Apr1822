//
//  ViewController.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/2/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var cartTableView: UITableView!
    
    @IBAction func searchButton(_ sender: Any) {
        if let searchText = searchField.text{
            viewModel.handleSearch(for: searchText, handleError: {
                self.handleError()
            }, completion: {
                self.presentResults()
            })
        }
    }
    
    let viewModel = HomeViewModel()
    @IBOutlet weak var favoritesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getFavorites()
        viewModel.getCart()
        configureTable()
        
       
        NotificationCenter.default.addObserver(forName: Notification.Name("Favorites"), object: nil, queue: nil, using: {
            _ in
            self.viewModel.getFavorites()
            self.favoritesTableView.reloadData()
        })
        
        NotificationCenter.default.addObserver(forName:Notification.Name("Cart"), object: nil, queue: nil, using: {
            _ in
            self.viewModel.getCart()
            self.cartTableView.reloadData()
        })
        // Do any additional setup after loading the view
    }
  
    func configureTable(){
        
        favoritesTableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        cartTableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        favoritesTableView.dataSource = self
        cartTableView.dataSource = self
        favoritesTableView.delegate = self
        cartTableView.delegate = self
    }
    func handleError(){
        let alert = UIAlertController()
        self.present(alert, animated: true, completion: nil)
    }
    func presentResults(){
        HomeCoordinator().presentResults(viewController: self, viewModel: viewModel)
    }
    
}

