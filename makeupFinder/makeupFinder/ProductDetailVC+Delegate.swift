//
//  ProductDetailVC+Delegate.swift
//  makeupFinder
//
//  Created by Rave Bizz on 4/11/22.
//

import Foundation
import UIKit

extension ProductDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return Contstants.cellSize * 0.5
        }
        return Contstants.cellSize - 20
    }
}
