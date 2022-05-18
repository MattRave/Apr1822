//
//  ProductDetailVC+DataSource.swift
//  makeupFinder
//
//  Created by Rave Bizz on 4/11/22.
//

import Foundation
import UIKit

extension ProductDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Contstants.shared.detailsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            if let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.productImage.rawValue) as? ProductPhotoCell{
                if let url = viewModel?.getPhoto(){
                    cell.imageUrl = url
                    
                    return cell
                }
            }
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.productDetailsID.rawValue)
            as? ProductDetailCell{
            switch cellOrder[indexPath.row]{
            case .photo:
                return cell
            case .productType:
                if let productType = viewModel?.getProductType(){
                    cell.productDetailLabel.text = productType
                    return cell
                }
                
            case .rating:
                cell.productDetailLabel.text = viewModel?.getRating()
                return cell
                
            case .description:
                if let description = viewModel?.getDescription(){
                    cell.productDetailLabel.text = description
                    return cell
                }
            case .productLink:
                if let productLink = viewModel?.getProducLink(){
                    cell.productDetailLabel.text = productLink
                    return cell
                }
            case .price:
                if let price = viewModel?.getPrice(){
                    cell.productDetailLabel.text = price
                    return cell
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
