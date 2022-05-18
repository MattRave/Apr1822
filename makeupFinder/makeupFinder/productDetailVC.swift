//
//  productDetailVC.swift
//  makeupFinder
//
//  Created by Rave Bizz on 4/8/22.
//

import Foundation
import UIKit

class ProductDetailViewController: UIViewController{
    @IBOutlet weak var produtTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ProductDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        configureTableView()
    }

    let cellOrder = [
        CellTypes.photo,
        CellTypes.productType,
        CellTypes.rating,
        CellTypes.description,
        CellTypes.productLink,
        CellTypes.price]
    
    func configureLabel(){
        produtTitle.text = viewModel?.makeupModel?.name
    }
    func configureTableView(){
        tableView.register(UINib(nibName: StringConstants.productDetailCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productDetailsID.rawValue)
        tableView.register(UINib(nibName: StringConstants.productImageNib.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productImage.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
}
