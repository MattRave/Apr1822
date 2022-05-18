//
//  CartVC+delegate.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit
extension CartViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Contstants.cellSize
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let makeupModel = viewModel.cart?[indexPath.row] else{
            return
        }
        let vc = ReuseableFunctions.shared.configureNewView(with: makeupModel)
        self.present(vc, animated: true, completion: nil)
    }
}
