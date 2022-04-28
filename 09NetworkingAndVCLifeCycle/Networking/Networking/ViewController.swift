//
//  ViewController.swift
//  Networking
//
//  Created by Rave Bizz on 4/28/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var accessibilitiLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    
    var activity: Activity?{
        didSet{
            if let activity = activity,
                let action = activity.activity,
               let type = activity.type,
                let participants = activity.friends,
               let link = activity.link,
                let accessibility = activity.accessibility{
                
                DispatchQueue.main.async {
                    self.activityLabel.text = action
                    self.typeLabel.text = type
                    self.participantsLabel.text = "\(participants)"
                    self.linkLabel.text = link
                    self.accessibilitiLabel.text = "\(accessibility)"
                }
            }
               
               
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManger.shared.getData(callBack: {
            activity in
            self.activity = activity
            print(self.activity!)
        })
        // Do any additional setup after loading the view.
    }

}

