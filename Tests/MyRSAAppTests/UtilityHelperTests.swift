import XCTest
@testable import MyRSAApp

final class UtilityHelperTests: XCTestCase {

    var helper: UtilityHelper!

    override func setUpWithError() throws {
        // Initialize before each test case runs
        helper = UtilityHelper()
    }

    override func tearDownWithError() throws {
        // Cleanup after each test case runs
        helper = nil
    }

    func testUtilityHelperNotNil() {
        // Test to verify the helper instance is initialized correctly
        XCTAssertNotNil(helper, "UtilityHelper should not be nil")
    }

    func testKeyGeneration() {
        // Test key generation (example function in UtilityHelper)
        let publicKey = helper.generateKey()
        XCTAssertNotNil(publicKey, "Generated public key should not be nil")
        XCTAssertTrue(publicKey.count > 0, "Generated public key should have a valid length")
    }

    func testSayHello() {
        // Test the sayHello() function (if applicable in UtilityHelper)
        let helloMessage = helper.sayHello()
        XCTAssertEqual(helloMessage, "Hello from UtilityHelper!", "sayHello() should return the correct greeting")
    }
}
