//
//  SecondViewController.swift
//  09-ViewControllerLifeCycles
//
//  Created by Rave Bizz on 4/27/22.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view  did Loaded \n")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear \n")
        if let colorKey = Color.allCases.randomElement(), let colorValue = ColorDict[colorKey]{
            view.backgroundColor = colorValue
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("\(size)")
    }
    override func viewWillLayoutSubviews() {
        print("view will layout Subviews")
    }
    override func viewDidLayoutSubviews() {
        print("view did layout Subviews \n")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear \n \n")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear \n \n")
    }
   
    deinit{
        print( "view has been deinitilzed")
    }
    
}
