//
//  ViewController.swift
//  17-initializers
//
//  Created by Rave Bizz on 5/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cat = Cat(names: ["mildred","renalds"])
        let
    }
}

class Animal{
    var makeNoise: () -> Void
    init(makeNoise: @escaping () -> Void){
        self.makeNoise = makeNoise
    }
    required init(noise: String){
        makeNoise = {print(noise)}
    }
    init(){
        makeNoise = {print("animal noises")}
    }
    convenience init(multipler: Int){
        self.init(noise: "noise")
        for _ in 0...multipler{
            makeNoise()
        }
    }
}


class Feline: Animal{
    convenience init(catNoise: String){
        self.init()
    }
    
    override init(){
        super.init()
        print("feline: ")
    }
    
    required init(noise: String) {
        fatalError("init(noise:) has not been implemented")
    }
    
}
                   
struct Cat {
    var name:String
    init(names: [String]){
        self.name = ""
        for x in names{
            self.name += x
        }
    }
}

