//
//  NetworkingTests.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

import XCTest
@testable import RandomUserAPI

final class NetworkingTests: XCTestCase {
    
    func testFormURL() {
        let url = Loader().formURL(usersCount: 1)
        
        XCTAssertNotNil(url)
        XCTAssertEqual(url!.scheme, "https")
        XCTAssertEqual(url!.host, "randomuser.me")
        XCTAssertEqual(url!.path, "/api")
        
        let queryParameters = getQueryParameters(of: url!)
        XCTAssertEqual(queryParameters["results"], "1")
    }
    
    func testCountNormalizationGreater() {
        let url = Loader().formURL(usersCount: 5_001)
        let queryParameters = getQueryParameters(of: url!)
        XCTAssertEqual(queryParameters["results"], "5000")
    }
    
    func testCountNormalizationLess() {
        let url = Loader().formURL(usersCount: -1)
        let queryParameters = getQueryParameters(of: url!)
        XCTAssertEqual(queryParameters["results"], "1")
    }
    
    func testDataDecoder() {
        let handler = NetworkHandler()
        let response = handler.decodeLoadedData(APIResponses.genderMale.data!, ofType: Gender.self)
        XCTAssertNotNil(try response.get())
    }
    
}

private extension NetworkingTests {
    
    func getQueryParameters(of url: URL) -> [String: String] {
        url.query!
            .split(separator: "&")
            .reduce(into: [:]) { dict, item in
                let keyValuePair = item.split(separator: "=").map(String.init)
                dict[keyValuePair[0]] = keyValuePair[1]
            }
    }
    
}
