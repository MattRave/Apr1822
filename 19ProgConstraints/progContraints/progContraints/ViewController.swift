//
//  ViewController.swift
//  progContraints
//
//  Created by Rave Bizz on 5/12/22.
//

import UIKit

class ViewController: UIViewController {

    let titleLabel = UILabel()
    let imageView = UIImageView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        
        
        applyTitleLabelConstraints()
        applyImageViewConstraints()
        
        
        configureTitleLabel()
        configureImageView()
    }
    
    func configureTitleLabel() {
        titleLabel.backgroundColor = .orange
        titleLabel.text = "Title here"
    }
    func applyTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureImageView() {
        imageView.image = UIImage(systemName: "house")
    }
    func applyImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
}

