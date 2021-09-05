//
//  Loader.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

import Foundation

struct Loader {
    
    typealias UsersResponse = (Result<[User], TextualError>) -> ()
    private let endpoint = "https://randomuser.me/api/"
    private let networkHandler = NetworkHandler()
    
    func loadUsers(usersCount: Int, completion: @escaping UsersResponse) {
        guard let url = formURL(usersCount: usersCount) else {
            completion(.failure("Failed to form request"))
            return
        }
        
        let task = networkHandler.loadDataFromURL(url, withType: Results.self) { resultsResponse in
            let usersResponse = resultsResponse.map(\.users)
            completion(usersResponse)
        }
        task.resume()
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