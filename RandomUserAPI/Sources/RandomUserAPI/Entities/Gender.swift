//
//  Gender.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

import Foundation.NSString

public enum Gender: String, Decodable {
    case male, female
}

extension Gender: CustomStringConvertible {
    
    public var description: String {
        NSLocalizedString(rawValue, comment: "")
    }
    
}
