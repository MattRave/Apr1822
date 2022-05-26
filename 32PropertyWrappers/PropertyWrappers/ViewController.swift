//
//  ViewController.swift
//  PropertyWrappers
//
//  Created by Luat on 2/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var textField: UITextField!
    @IBAction func slidedSlided(_ sender: UISlider) {
        settingsVM.numberOfSearchResultsPerPage = Int(sender.value)
    }
    @IBAction func switchSwitched(_ sender: UISwitch) {
        settingsVM.autoMarkMessagesAsRead = sender.isOn
    }
    @IBAction func textFieldTexted(_ sender: UITextField) {
        settingsVM.messageSignature = sender.text
    }
    
    var settingsVM = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        slider.value = Float(settingsVM.numberOfSearchResultsPerPage)
        mySwitch.isOn = settingsVM.autoMarkMessagesAsRead
        textField.text = settingsVM.messageSignature
    }
    
}

