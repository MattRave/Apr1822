//
//  CartViewController.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import UIKit

class CartViewController: UIViewController {

    @IBAction func checkoutButton(_ sender: Any) {
        CartCoordinator().presentCheckout(viewController: self)
    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var viewModel = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCart()
        priceLabel.text = viewModel.getTotal()
        configureTable()
    }
    
    func configureTable(){
        tableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }

}
