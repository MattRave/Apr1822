//
//  DispatchGroupViewController.swift
//  17-GCD
//
//  Created by Rave Bizz on 5/10/22.
//

import UIKit
import SnapKit

class DispatchGroupViewController: UIViewController {
    let viewModel = ViewModel()
    let image = UIImageView()
    let label = UILabel()
    let color = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupUI()
    }
    
    func fetchData(){
        let functions = [viewModel.fetchColor, viewModel.fetchActivity, viewModel.fetchDogPhoto]
        let dispatchGroup = DispatchGroup()
        for function in functions {
            dispatchGroup.enter()
            function({dispatchGroup.leave()})
        }
        
        dispatchGroup.notify(queue: .main, execute: { [unowned self] in
            if let url = URL(string: self.viewModel.dogPhoto ?? ""){
                self.image.getImage(for:url , callback:{
                    self.image.setNeedsDisplay()
                })
                
            }
            label.text = self.viewModel.activity ?? "mistakes were made"
            
            color.text = "background color name: \(self.viewModel.colorName ?? "no color")"
            self.view.backgroundColor = .init(red: CGFloat(self.viewModel.colorvalue[0])/255, green: CGFloat(self.viewModel.colorvalue[1])/255, blue: CGFloat(self.viewModel.colorvalue[2])/255, alpha: 1)
        })
    }
    
    
    func setupUI(){
        view.addSubview(label)
        view.addSubview(image)
        view.addSubview(color)
        image.snp.makeConstraints({
            make in
            make.width.height.equalTo(150)
            make.centerX.centerY.equalToSuperview()
        })
        color.snp.makeConstraints({
            make in
            make.centerX.equalToSuperview()
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.bottom.equalTo(-90)
        })
        color.numberOfLines = 0
        color.lineBreakMode = .byWordWrapping
        color.textColor = .white
        color.text = "helloafasfhgjkgfchgvjbkjnlmk;l,kmjnhbgvh"
        color.textAlignment = .center
        label.snp.makeConstraints({
            make in
            make.centerX.equalToSuperview()
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(90)
        })
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.text = "helloafasfhgjkgfchgvjbkjnlmk;l,kmjnhbgvh"
        image.image = .actions
        
    }
    
}


class ViewModel{
    
    var activity: String?
    var dogPhoto: String?
    var colorName: String?
    var colorvalue: [Int] = []
    
    func fetchActivity(completion: @escaping () -> Void){
        APIManger.shared.getData(model: BoredModel.self, url: .bored, completion: {
            model in
            self.activity = model.activity
            completion()
        })
    }
    func fetchDogPhoto(completion: @escaping () -> Void){
        APIManger.shared.getData(model: DogModel.self, url: .dog, completion: {
            model in
            self.dogPhoto = model.url
            completion()
        })
    }
    func fetchColor(completion: @escaping () -> Void){
        APIManger.shared.getData(model: ColorModel.self, url: .color, completion: {
            model in
            let color = model.colors.randomElement() ?? model.colors[1]
            self.colorName = color.name.value
            self.colorvalue.append(color.rgb.r)
            self.colorvalue.append(color.rgb.g)
            self.colorvalue.append(color.rgb.b)
            completion()
        })
    }
}
