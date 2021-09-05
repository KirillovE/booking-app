//
//  User.swift
//  BookingApp
//
//  Created by Zenchef on 03/05/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

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
