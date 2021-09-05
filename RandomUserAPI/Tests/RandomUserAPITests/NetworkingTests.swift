//
//  NetworkingTests.swift
//  
//
//  Created by Евгений Кириллов on 05.09.2021.
//

import XCTest
@testable import RandomUserAPI

final class NetworkingTests: XCTestCase {
    
    func testDataDecoder() {
        let handler = NetworkHandler()
        let response = handler.decodeLoadedData(APIResponses.genderMale.data!, ofType: Gender.self)
        XCTAssertNotNil(try response.get())
    }
    
}
