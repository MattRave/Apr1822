//
//  ViewModel.swift
//  14-observers
//
//  Created by Rave Bizz on 5/5/22.
//

import Foundation

class ViewModel{
    var model: BoredRespose?
    
    func getData(completion: @escaping () -> Void){
        APIManager.shared.getData(completion: {
            model in
            self.model = model
            completion()
        })
    }
    
    func getActivity() -> String? {
        model?.activity
    }
    
    func getType() -> String? {
        if let activityType = model?.type {
            return "\n \n activity type: \(activityType)"
        }
        return nil
    }
    
    func getParticipants() -> String?{
        if let participants = model?.participants {
            
            var participantsStr = " \n  \n you can do this with \(participants - 1 ) other people"
            
            if participants == 1{
                participantsStr = "\n \n this activity must be done alone"
            }
            
            if participants == 2{
                participantsStr = " \n  \n you can do this with \(participants - 1 ) other person"
            }
            return participantsStr
            
        }
        return nil
    }
    
    func getCompleteString() -> String?{
        if let activity = self.getActivity(),
           let myType = self.getType(),
           let paticipants = self.getParticipants(){
            return "\(activity) \(myType) \(paticipants)"
        }
        return nil
    }
    
}
