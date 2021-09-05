//
//  EntitiesDecodingTests.swift
//
//
//  Created by Евгений Кириллов on 05.09.2021.
//

import XCTest
@testable import RandomUserAPI

final class EntitiesDecodingTests: XCTestCase {
    
    private let decoder = JSONDecoder()
    
    func testGenderMale() {
        let response = getDecodedResponse(ofType: Gender.self, from: .genderMale)
        XCTAssertEqual(response, .male)
    }
    
    func testGenderFemale() {
        let response = getDecodedResponse(ofType: Gender.self, from: .genderFemale)
        XCTAssertEqual(response, .female)
    }
    
    func testDOB() {
        let response = getDecodedResponse(ofType: DOB.self, from: .dob)
        XCTAssertEqual(response?.age, 58)
        XCTAssertEqual(response?.date, "1963-11-02T22:22:16.330Z")
    }
    
    func testFullName() {
        let response = getDecodedResponse(ofType: FullName.self, from: .fullName)
        XCTAssertEqual(response?.title, "Mr")
        XCTAssertEqual(response?.first, "Marcos")
        XCTAssertEqual(response?.last, "Lopez")
    }
    
    func testUser() {
        let response = getDecodedResponse(ofType: User.self, from: .user)
        XCTAssertEqual(response?.email, "marcos.lopez@example.com")
        XCTAssertEqual(response?.phone, "969-542-806")
        XCTAssertEqual(response?.cell, "662-767-563")
        XCTAssertEqual(response?.age, 58)
        XCTAssertEqual(response?.gender, .male)
        XCTAssertEqual(response?.name.title, "Mr")
    }
    
}

private extension EntitiesDecodingTests {
    
    func getDecodedResponse<T: Decodable>(ofType type: T.Type, from input: APIResponses) -> T? {
        try? decoder.decode(type.self, from: input.data!)
    }
    
}
