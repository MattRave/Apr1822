//
//  ViewController.swift
//  08-MVC
//
//  Created by Rave Bizz on 4/25/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: view notifies View Controller
    @IBAction func submitAction(_ sender: Any) {
        handleSubmit()
    }
    
    @IBOutlet weak var photoPicker: UISegmentedControl!
    @IBOutlet weak var colorPicker: UISegmentedControl!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var MyImage: UIImageView!
    
    var data: ScreenData?{
        // MARK: notifying contoller
        didSet{
            // MARK: updating the view
            myLabel.text = data?.text
            MyImage.image = .init(systemName: (data?.photo)!)
            switch data?.color{
            case "blue":
                view.backgroundColor = .blue
            case "black":
                view.backgroundColor = .black
            case "green":
                view.backgroundColor = .green
            case "red":
                view.backgroundColor = .red
            default:
                return
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func handleSubmit(){
        // MARK: preparing data for model
        var color: String
        var photo: String
        
        guard let text = textInput.text else{
            return
        }
        switch colorPicker.selectedSegmentIndex{
        case 0:
            color = "blue"
        case 1:
            color = "red"
        case 2:
            color = "green"
        case 3:
            color = "black"
        default:
            return
        }
        switch photoPicker.selectedSegmentIndex{
        case 0:
            photo = "moon.fill"
        case 1:
            photo = "cloud.fill"
        case 2:
            photo =
            "flame.fill"
        case 3:
            photo = "drop.fill"
        default:
            return
        }
        //MARK: Udate the model
        self.data = .init(color: color, text: text, photo: photo)
    
    }

        
    
    
}

