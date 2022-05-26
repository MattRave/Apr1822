//
//  UserDefaults+ext.swift
//  PropertyWrappers
//
//  Created by Luat on 2/8/22.
//

import Foundation

/// Allows for a shared UserDefault instance accessed by multiple apps in the same app group
extension UserDefaults {
    static var shared: UserDefaults {
        let combined = UserDefaults.standard
        combined.addSuite(named: "group.johnsundell.app")
        return combined
    }
}
