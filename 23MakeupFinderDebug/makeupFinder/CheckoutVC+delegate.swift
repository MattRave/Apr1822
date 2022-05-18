//
//  CheckoutVC+delegate.swift
//  makeupFinder
//
//  Created by Rave Bizz on 5/3/22.
//

import Foundation
import UIKit

extension CheckoutViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Contstants.cellSize
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.presentPayment(vc: self)
    }
}
