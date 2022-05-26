//
//  UserDefaultBacked+ext.swift
//  PropertyWrappers
//
//  Created by Luat on 2/8/22.
//

import Foundation

/// Set wrapped value to have a default value of nil
extension UserDefaultsBacked where Value: ExpressibleByNilLiteral {
    init(key: String, storage: UserDefaults = .standard) {
        self.init(wrappedValue: nil, key: key, storage: storage)
    }
}
