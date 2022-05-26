//
//  User.swift
//  PropertyWrappers
//
//  Created by Luat on 2/8/22.
//

import Foundation

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

struct Document {
    @Capitalized var name = "Untitled document"
    func getUser() -> User {
        let user = User(firstName: "bobby", lastName: "bob")
        return user
    }
}
