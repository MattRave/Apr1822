//
//  ViewController.swift
//  07-enums
//
//  Created by Rave Bizz on 4/25/22.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func segementAction(_ sender: UISegmentedControl) {
        handleChange(segment: sender)
    }
    
    
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    enum Photo: String, CaseIterable {
        case fire = "flame"
        case drop = "drop"
    }
    @objc func handleChange(segment: UISegmentedControl){
        let index = segment.selectedSegmentIndex
        let photName = Photo.allCases[index].rawValue
        myImage.image = UIImage.init(systemName: photName)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentController.addTarget(self, action: #selector(handleChange(segment:)), for: .valueChanged)
        
        
        
    }

    
    
    
    func enumStuff(){
        //MARK: enumeration syntax
        enum Direction: CaseIterable{
            case south
            case east
            case west
            case north
        }
        
            //MARK: short hand syntax
        enum flavors{
            case salty, sweet, savory, bitter
        }
        
            // MARK: switching over enums
        let myDirection = Direction.west
        
        switch myDirection {
        case .south:
            print("youre going south")
        case .east:
            print("youre going east")
        case .west:
            print("youre going west")
        case .north:
            print("youre going north")
        }
        
            // MARK: iterating over enums
        for color in Color.allCases{
            print("my color: \(color.rawValue)")
        }
            // MARK: associated values
        enum Barcode{
            case qr(String)
            case barcode(Int, Int, Int)
        }
        let myBarcode = Barcode.barcode(101, 102, 103)
        let myBarcode2 = Barcode.qr("qweqr1238974m")
        
        switch myBarcode2 {
        case .qr(let code):
            print("your code is \(code)")
        case .barcode(let location, let serial, let destionation):
            print("your location \(location) your destination \(destionation)your serial \(serial)")
        }
            // MARK: short hand sytax
    switch myBarcode {
    case let .qr(code):
        print("your code is \(code)")
    case let .barcode(location, serial, destionation):
        print("your location \(location) your destination \(destionation)your serial \(serial)")
    }
        
        
            //MARK: raw values
        enum Funiture: Int{
            case chair = 0
            case table = 1
            case couch = 2
        }
        
        
            //MARK: Implicitly Assigned Raw Values
        enum Color: String, CaseIterable{
            case red
            case blue
            case green
        }
        enum Drinks: Int{
            case tea
            case coffee
            case water
        }
        print(Color.red.rawValue)
        
            //MARK: initializing using rawValues
        let myColor = Color(rawValue: "red")
        
        
            //MARK: recursive enums (indirect)
            //this can get complicated but feel free to research if youre curious
    }

}

