//
//  CheckView+DataSource.swift
//  makeupFinder
//
//  Created by Rave Bizz on 5/3/22.
//

import Foundation
import UIKit
extension CheckoutViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.cart?.count{
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.productCellID.rawValue) as? ProductCell{
            if let model = viewModel.cart?[indexPath.row]{
                cell.viewModel.model = model
            }
            cell.configureView()
            cell.addToCartButton.isHidden = true
            cell.addToFavorites = {
//                self.addToFavorites(index: indexPath.row)
            }
            cell.refresh = {
                self.refresh()
            }
            
            return cell
        }
        return UITableViewCell()
    }
}
