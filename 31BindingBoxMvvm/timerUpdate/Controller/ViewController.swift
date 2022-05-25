//
//  ViewController.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import UIKit

class ViewController: UIViewController {

    var label = UILabel()
    var viewModel = AccessCodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCode()
        
        viewModel.bind { code in
            self.label.text = code
        }
        
        setupLabel()
    }


    func setupLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -15),
            view.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
        ])
        
        label.text = "Your access code"
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        label.backgroundColor = .systemTeal
    }

}

