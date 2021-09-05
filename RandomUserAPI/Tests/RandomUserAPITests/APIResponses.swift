//
//  APIResponses.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

import Foundation

enum APIResponses {
    case results, user, gender, fullName, dob
    
    var data: Data? {
        response.data(using: .utf8)
    }
}

private extension APIResponses {
    
    var response: String {
        switch self {
        case .results:
            return resultsResponse
        case .user:
            return userResponse
        case .gender:
            return genderResponse
        case .fullName:
            return fullNameRsponse
        case .dob:
            return dobResponse
        }
    }
    
    var resultsResponse: String {
        """
        {
            "results": [
                {
                    "gender": "male",
                    "name": {
                        "title": "Mr",
                        "first": "Marcos",
                        "last": "Lopez"
                    },
                    "email": "marcos.lopez@example.com",
                    "dob": {
                        "date": "1963-11-02T22:22:16.330Z",
                        "age": 58
                    },
                    "phone": "969-542-806",
                    "cell": "662-767-563"
                }
            ]
        }
        """
    }
    
    var userResponse: String {
        """
        {
            "gender": "male",
            "name": {
                "title": "Mr",
                "first": "Marcos",
                "last": "Lopez"
            },
            "email": "marcos.lopez@example.com",
            "dob": {
                "date": "1963-11-02T22:22:16.330Z",
                "age": 58
            },
            "phone": "969-542-806",
            "cell": "662-767-563"
        }
        """
    }
    
    var genderResponse: String {
        """
        {
            "gender": "male"
        }
        """
    }
    
    var fullNameRsponse: String {
        """
        {
            "title": "Mr",
            "first": "Marcos",
            "last": "Lopez"
        }
        """
    }
    
    var dobResponse: String {
        """
        {
            "date": "1963-11-02T22:22:16.330Z",
            "age": 58
        }
        """
    }
    
}
