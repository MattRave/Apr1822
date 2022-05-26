//
//  SettingsViewModel.swift
//  PropertyWrappers
//
//  Created by Luat on 2/8/22.
//

import Foundation

struct SettingsViewModel {
    @UserDefaultsBacked(key: "mark-as-read")
    var autoMarkMessagesAsRead = true
    
    @UserDefaultsBacked(key: "search-page-size")
    var numberOfSearchResultsPerPage = 20
    
    @UserDefaultsBacked(key: "signature")
    var messageSignature: String?
}



/*
 /// Using shared UserDefaults for multiple apps in the same app group
 
 struct SharedSettingsViewModel {
 @UserDefaultsBacked<Bool>(key: "mark-as-read", storage: .shared)
 var autoMarkMessagesAsRead
 
 @UserDefaultsBacked<Int>(key: "search-page-size", storage: .shared)
 var numberOfSearchResultsPerPage
 }
 
 */
