//
//  File.swift
//  makeupFinder
//
//  Created by Rave Bizz on 5/2/22.
//

import Foundation
import UIKit
import SnapKit

class CheckoutViewController: UIViewController{
    let tableView = UITableView()
    let labelTitle = UILabel()
    let logo = UIImageView()
    let viewModel = CartViewModel()
    let coordinator = checkoutCoordinator()
    
    override func viewDidLoad() {
        configureView()
    }
    
    func configurelabel(){
        labelTitle.text = "Makeup Finedr"
        labelTitle.textAlignment = .center
        labelTitle.textColor = .white
        labelTitle.font = .italicSystemFont(ofSize: 34)
        labelTitle.snp.makeConstraints({
            make in
            make.centerX.equalToSuperview()
            make.top.equalTo(40 + 59)
        })
    }
    func configureLogo(){
        logo.image = UIImage(systemName: "eyebrow")
        logo.contentMode = .scaleAspectFit

        logo.tintColor = .white
            logo.snp.makeConstraints({
                make in
                make.height.equalTo(59)
                make.width.equalTo(77)
                make.centerX.equalToSuperview()
                make.top.equalTo(30)
            })
        
    }
    func refresh(){
        tableView.reloadData()
    }
    func attachSubviews(){
        view.addSubview(tableView)
        view.addSubview(logo)
        view.addSubview(labelTitle)
    }
    func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: StringConstants.productCellName.rawValue, bundle: nil), forCellReuseIdentifier: StringConstants.productCellID.rawValue)
        tableView.snp.makeConstraints({
            make in
            make.height.equalTo(522)
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(150)
        })
    }
    func configureView(){
        attachSubviews()
        configurelabel()
        configureLogo()
        configureTableView()
        view.backgroundColor = UIColor.background
       
        
    }
}

