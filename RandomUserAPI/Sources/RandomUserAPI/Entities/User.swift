//
//  User.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

public struct User: Decodable {
    let gender: Gender
    let name: FullName
    let email: String
    let phone: String
    let cell: String
    private let dob: DOB
    var age: Int {
        dob.age
    }
}
