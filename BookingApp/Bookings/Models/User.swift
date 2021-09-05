//
//  User.swift
//  BookingApp
//
//  Created by Zenchef on 03/05/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import RandomUserAPI

struct User {
    let title: String
    let firstName: String
    let lastName: String
    let gender: Gender
    let email: String
    let phone: String
    let age: Int
    
    var fullName: String {
        "\(title) \(firstName) \(lastName)"
    }
    
    var shortName: String {
        let firstNameLetter = firstName.first.map { "\($0). " } ?? ""
        return "\(title) \(firstNameLetter)\(lastName)"
    }
}

extension User {
    
    enum Gender {
        case male, female
    }

}

extension User {

    init(fromAPI user: RandomUserAPI.User) {
        title = user.name.title
        firstName = user.name.first
        lastName = user.name.last
        email = user.email
        phone = user.phone
        age = user.age
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
