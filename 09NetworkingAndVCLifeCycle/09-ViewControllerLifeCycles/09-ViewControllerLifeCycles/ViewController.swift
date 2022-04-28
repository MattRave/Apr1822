//
//  ViewController.swift
//  09-ViewControllerLifeCycles
//
//  Created by Rave Bizz on 4/27/22.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("### first view  did Loaded: \(count) \n")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("### first view will appear \n")
        count += 1
        if let colorKey = Color.allCases.randomElement(), let colorValue = ColorDict[colorKey]{
            view.backgroundColor = colorValue
        }
        
    }

    override func viewWillLayoutSubviews() {
        print("### first view will layout Subviews")
    }

    override func viewDidLayoutSubviews() {
        print("### first view did layout Subviews \n")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("### first view did appear :\(count) \n \n")
        count += 1
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("### first view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("### first view did disappear \n \n")
    }
   
}

