//
//  Loader.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

import Foundation

struct Loader {
    
    private let endpoint = "https://randomuser.me/api/"
    
    func loadUsers(usersCount: Int) {
        
    }
}

extension Loader {
    
    func formURL(usersCount: Int) -> URL? {
        let normalizationRange = 1...5_000
        let normalizedCount = max(
            min(usersCount, normalizationRange.upperBound),
            normalizationRange.lowerBound
        )
        
        var components = URLComponents(string: endpoint)
        let queryItems: [URLQueryItem] = [
            .init(name: "results", value: String(normalizedCount))
        ]
        components?.queryItems = queryItems
        
        return components?.url
    }
    
}
