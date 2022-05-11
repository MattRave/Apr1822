//
//  SingletonPattern.swift
//  localPersist
//
//  Created by Rave Bizz on 5/11/22.
//

import Foundation

// MARK: - UserDefaults is a Singleton
class MySingleton {
    private init() {}
    static let shared = MySingleton()
}

