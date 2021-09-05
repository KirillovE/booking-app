//
//  TextualError.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

public struct TextualError: Error, CustomStringConvertible {
    public let description: String
}

extension TextualError: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        description = value
    }
    
}
