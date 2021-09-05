//
//  NetworkHandler.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

import Foundation

struct NetworkHandler {
    
    private let session: URLSession
    private let decoder = JSONDecoder()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func loadDataFromURL<T: Decodable>(
        _ url: URL,
        withType type: T.Type,
        completion: @escaping (Result<T, TextualError>) -> ()
    ) -> URLSessionDataTask {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                let responseError = TextualError(stringLiteral: error.localizedDescription)
                completion(.failure(responseError))
                return
            }
            
            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let serverError = TextualError(description: response.debugDescription)
                completion(.failure(serverError))
                return
            }
            
            guard
                let mimeType = httpResponse.mimeType,
                mimeType == "application/json",
                let loadedData = data
            else {
                let errorString = NSLocalizedString("Invalid response format", comment: "")
                let error = TextualError(description: errorString)
                completion(.failure(error))
                return
            }
            
            let decodedResponse = decodeLoadedData(loadedData, ofType: type.self)
            completion(decodedResponse)
        }
    }
    
    func decodeLoadedData<T: Decodable>(
        _ data: Data,
        ofType type: T.Type
    ) -> Result<T, TextualError> {
        do {
            let decodedData = try decoder.decode(type.self, from: data)
            return .success(decodedData)
        } catch let decodingError {
            let decodingErrorText = TextualError(description: decodingError.localizedDescription)
            return .failure(decodingErrorText)
        }
    }
    
}
