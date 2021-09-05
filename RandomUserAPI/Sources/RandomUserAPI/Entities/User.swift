//
//  User.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

public struct User: Decodable {
    private let dob: DOB
    
    public let gender: Gender
    public let name: FullName
    public let email: String
    public let phone: String
    public let cell: String
    public var age: Int {
        dob.age
    }
}
