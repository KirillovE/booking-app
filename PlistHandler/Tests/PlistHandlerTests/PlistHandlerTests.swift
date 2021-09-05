import XCTest
@testable import PlistHandler

final class PlistHandlerTests: XCTestCase {
    
    private let handler = PlistHandler()
    
    func testFailure() {
        let value: String? = handler.getValueForKey("some", using: .module)
        XCTAssertNil(value)
    }
    
    func testSuccessNumber() {
        let value: Int? = handler.getValueForKey("IntegerKey", using: .module)
        XCTAssertNotNil(value)
        XCTAssertEqual(value!, 7)
    }
    
    func testSuccessString() {
        let value: String? = handler.getValueForKey("StringKey", using: .module)
        XCTAssertNotNil(value)
        XCTAssertEqual(value!, "Ici c'est Paris")
    }
    
}
