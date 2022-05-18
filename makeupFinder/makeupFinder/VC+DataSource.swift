//
//  VC+DataSource.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag{
        case 0:
            if let count = viewModel.cart?.count{
                return count
            }
            return 0
        case 1:
            if let count = viewModel.favorites?.count{
                return count
            }
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 0:
            if let cell = cartTableView.dequeueReusableCell(withIdentifier: StringConstants.productCellID.rawValue) as? ProductCell{
                guard let count = viewModel.favorites?.count else{
                    return UITableViewCell()
                }
                if (indexPath.row != count) {
                    cell.viewModel.model = viewModel.cart?[indexPath.row]
                }
                
                cell.configureView()
                cell.addToCartButton.isHidden = true
                cell.addToFavorites = {
                    self.addToFavorites(index: indexPath.row)
                }
                cell.refresh = {
                    tableView.reloadData()
                }
                return cell
            }
        case 1:
            if let cell = favoritesTableView.dequeueReusableCell(withIdentifier: StringConstants.productCellID.rawValue) as? ProductCell{
                cell.viewModel.model = viewModel.favorites?[indexPath.row]
                cell.configureView()
                cell.heartButton.isHidden = true
                cell.favoriteButton.isHidden = true
                cell.addToCart = {
                    self.addToCart(index: indexPath.row)
                }
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func addToCart(index: Int){
        self.viewModel.addTo(atIndex: index, withTag: 1)
        
        let alert = UIAlertController(for: StringConstants.cart.rawValue, confirmAction: {
            self.presentCart()
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentCart(){
        HomeCoordinator().presentCart(viewController: self)
    }
    
    func addToFavorites(index: Int){
        self.viewModel.addTo(atIndex: index, withTag: 0)
        
        let alert = UIAlertController(for: StringConstants.favorites.rawValue, confirmAction: {
            self.presentFavorites()
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentFavorites(){
        HomeCoordinator().presentFavorites(viewController: self)
    }
}
    
    
