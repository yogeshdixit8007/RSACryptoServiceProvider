import XCTest
@testable import UtilityHelperLib

final class UtilityHelperTests: XCTestCase {

    var helper: UtilityHelper!

    override func setUpWithError() throws {
        helper = UtilityHelper()
    }

    override func tearDownWithError() throws {
        helper = nil
    }

    func testUtilityHelperNotNil() {
        XCTAssertNotNil(helper)
    }

    func testKeyGeneration() {
        let publicKey = helper.generateKey()
        XCTAssertNotNil(publicKey)
        XCTAssertTrue(publicKey.count > 0)
    }
}
