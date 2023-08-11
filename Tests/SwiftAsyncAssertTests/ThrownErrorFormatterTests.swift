import XCTest

@testable import SwiftAsyncAssert

final class ThrownErrorFormatterTests: XCTestCase {

    func test_should_format_thrown_error() {
        XCTAssertEqual(ThrownErrorFormatter.formattedStringForThrownError(TestingError.systemFailedToWork,
                                                                          in: "AsyncAssert(_:_:file:line:)",
                                                                          message: ""),
                       "AsyncAssert failed: threw error \"systemFailedToWork\"")
    }

    func test_should_format_thrown_error_with_message() {
        XCTAssertEqual(ThrownErrorFormatter.formattedStringForThrownError(TestingError.systemFailedToWork,
                                                                          in: "AsyncAssert(_:_:file:line:)",
                                                                          message: "Additional message"),
                       "AsyncAssert failed: threw error \"systemFailedToWork\" - Additional message")
    }
}
