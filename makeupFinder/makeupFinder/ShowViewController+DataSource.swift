//
//  ShowViewController+DataSource.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit

extension ShopViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.recommendeds?.count{
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.productCellID.rawValue) as? ProductCell{
            cell.viewModel.model = viewModel.recommendeds?[indexPath.row]
            cell.configureView()
            cell.addToFavorites = {
                self.addToFavorites(index: indexPath.row)
            }
            cell.addToCart = {
                self.addToCart(index: indexPath.row)
            }
            cell.refresh = {
                tableView.reloadData()
            }
            return cell
        }
        return UITableViewCell()
    }
    func addToFavorites(index: Int){
        self.viewModel.addToFavorites(atIndex: index)
        let alert = UIAlertController(for: StringConstants.favorites.rawValue, confirmAction: {
            
        })
        self.present(alert, animated: true, completion: nil)
    }
    func presentFavorites(){
        ShopCoordinator().presentFavorite(viewController: self)
    }
    
    func addToCart(index: Int){
        self.viewModel.addToCart(atIndex: index)
        let alert = UIAlertController(for: StringConstants.cart.rawValue, confirmAction: {
            self.presentCart()
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentCart(){
        ShopCoordinator().presentCart(viewController: self)
    }
}
