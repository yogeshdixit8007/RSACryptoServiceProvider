import XCTest
@testable import MyRSAApp

final class UtilityHelperTests: XCTestCase {
    func testKeyGeneration() {
        let helper = UtilityHelper()
        XCTAssertNotNil(helper)
    }
}
