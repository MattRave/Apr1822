//
//  MainGlobalViewController.swift
//  17-GCD
//
//  Created by Rave Bizz on 5/10/22.
//

import UIKit
import SnapKit

class MainGlobalViewController: UIViewController {
    let button: UIButton = .init(type: .roundedRect)
    let label: UILabel = .init()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(label)
        label.text = ""
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
            make.left.equalTo(50)
            make.left.equalTo(50)
        }
        button.setTitle("button", for: .normal)
        button.snp.makeConstraints({
            make in
            make.centerX.centerY.equalToSuperview()
        })
        
        button.addTarget(self, action: #selector(global), for: .touchUpInside)
        

    }
    @objc func global(){
        let dq = DispatchQueue.global(qos: .userInteractive)
         dq.async {
             print("entering userInteractive")
             do {sleep(5)}
             self.main(QOS: "userInteractive")
             do {sleep(5)}
             
            }
        let dq2 = DispatchQueue.global(qos: .userInitiated)
         dq2.async {
             print("entering userInitiated")
             
             self.main(QOS: "userInitiated")
             
            }
        let dq3 = DispatchQueue.global(qos: .utility)
         dq3.async {
             print("entering utility")
             do {sleep(5)}
             self.main(QOS: "utility")
             do {sleep(5)}
            }
        let dq4 = DispatchQueue.global(qos: .background)
         dq4.async {
             print("entering utility")
             do {sleep(5)}
             self.main(QOS: "background")
             
            }
        
    }
    
    func main(QOS: String){
        DispatchQueue.main.async {
            self.label.text = "leaving global completeing qos: \(QOS)"
        }
    }

}
