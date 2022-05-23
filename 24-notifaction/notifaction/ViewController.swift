//
//  ViewController.swift
//  notifaction
//
//  Created by Rave Bizz on 5/20/22.
//

import UIKit
import NotificationCenter
import CoreLocation

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    @IBOutlet weak var setNotifactionButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    let notifactionCenter = UNUserNotificationCenter.current()
    var id = "1"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup delegate
        notifactionCenter.delegate = self
        // request permison
        
        getPermission(completion: {
            granted in
//            self.setNotifactionButton.isEnabled = granted
        })
        self.getSettings()
        
        // create content of notifacation
        // create trigger
            //time interval
            //date
            //location
        // create request
            //with content and trigger
        // add request to UNUserNotificationCenter
        deleteButton.addTarget(self, action: #selector(handleRemoval), for: .touchUpInside)
        setNotifactionButton.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
    }
    @objc func handleRemoval(){
        notifactionCenter.removePendingNotificationRequests(withIdentifiers: ["1"])
        
    }
    @objc func handleAction(){
        prepareNotifaction()
    }
    func getSettings(){
        notifactionCenter.getNotificationSettings(completionHandler: {
            setting in
            switch setting.authorizationStatus{
            case .authorized:
                DispatchQueue.main.async {
                    self.setNotifactionButton.isEnabled = true
                }
                
            default:
                DispatchQueue.main.async {
                    self.setNotifactionButton.isEnabled = false
                }
            }
        })
    }
    func getPermission(completion: @escaping (Bool) -> Void){
        notifactionCenter.requestAuthorization(options: [.alert,.sound], completionHandler: {
            asscesGranted, error in
            DispatchQueue.main.async {
                completion(asscesGranted)
            }
            
            if let error = error{
                print(error)
            }
        })
    }
    
    func prepareNotifaction(){
        let content = UNMutableNotificationContent()
        content.title = "hello"
        content.body = "you have beeen notified"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        id += "1"
        
        notifactionCenter.add(request)
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
    
    
    
    
    
//    @objc func handleAction(){
//        scheduleNotification()
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 1
    func requestPermission(completion: @escaping (Bool)-> Void){
    notifactionCenter.requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {
        authorized, error in
        DispatchQueue.main.async {
            completion(authorized)
        }
        })
    }
    
    func scheduleNotification() {
        // 2
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.body = "Gentle reminder for your task!"
        
        // 3
        var trigger: UNNotificationTrigger?
        
        trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 4,
            repeats: false)
        // 4
        /*
         
         let trigger = UNCalendarNotificationTrigger(dateMatching: .init(calendar: .current, timeZone: .current), repeats: false)
         */
        /*
         let center = CLLocationCoordinate2D(
          latitude: .init(),
          longitude: .init())
          let region = CLCircularRegion(
                center: center,
                radius: 1.5,
                identifier: "SOmeID")
         let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
         */
       
        if let trigger = trigger {
            let request = UNNotificationRequest(
                identifier: id,
                content: content,
                trigger: trigger)
            // 5
            id += "1"
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
    func removeScheduledNotification(id: String) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [id])
    }
    

//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.banner, .badge, .sound])
//    }
    // Do any additional setup after loading the view.
}




