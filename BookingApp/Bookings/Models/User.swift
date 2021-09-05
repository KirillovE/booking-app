//
//  User.swift
//  BookingApp
//
//  Created by Zenchef on 03/05/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import RandomUserAPI

struct User {
    let firstName: String
    let lastName: String
    let fullName: String
    let gender: Gender
    let email: String
    let phone: String
    let age: Int
}

extension User {
    
    enum Gender {
        case male, female
    }

}

extension User {

    init(fromAPI user: RandomUserAPI.User) {
        firstName = user.name.first
        lastName = user.name.last
        fullName = "\(user.name.title) \(user.name.first) \(user.name.last)"
        email = user.email
        phone = user.phone
        age = 1//user.age
        gender = user.gender == .male
            ? .male
            : .female
    }
    
}

extension User: CustomStringConvertible {
    
    var description: String {
        """
        \(fullName):
            first name: \(firstName)
            last name: \(lastName)
            gender: \(gender)
            email address: \(email)
            phone number: \(phone)
            age: \(age)
        """
    }
    
}
