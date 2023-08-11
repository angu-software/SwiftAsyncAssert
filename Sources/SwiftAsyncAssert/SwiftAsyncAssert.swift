import XCTest

public func AsyncAssert(_ expression: @autoclosure () async throws -> Bool,
                           _ message: @autoclosure () -> String = "",
                           file: StaticString = #filePath,
                           line: UInt = #line) async {
    await AssertExpressionEvaluator.evaluate({
        let result = try await expression()
        XCTAssert(result, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertEqual<T>(_ expression1: @autoclosure () async throws -> T,
                                _ expression2: @autoclosure () async throws -> T,
                                _ message: @autoclosure () -> String = "",
                                file: StaticString = #filePath,
                                line: UInt = #line) async where T : Equatable {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertEqual(result1, result2, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertEqual<T>(_ expression1: @autoclosure () async throws -> T,
                                _ expression2: @autoclosure () async throws -> T,
                                accuracy: T,
                                _ message: @autoclosure () -> String = "",
                                file: StaticString = #filePath,
                                line: UInt = #line) async where T : FloatingPoint {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertEqual(result1, result2, accuracy: accuracy, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertEqual<T>(_ expression1: @autoclosure () async throws -> T,
                                _ expression2: @autoclosure () async throws -> T,
                                accuracy: T,
                                _ message: @autoclosure () -> String = "",
                                file: StaticString = #filePath,
                                line: UInt = #line) async where T : Numeric {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertEqual(result1, result2, accuracy: accuracy, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertFalse(_ expression: @autoclosure () async throws -> Bool, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async {
    await AssertExpressionEvaluator.evaluate({
        let result = try await expression()
        XCTAssertFalse(result, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertGreaterThan<T>(_ expression1: @autoclosure () async throws -> T, _ expression2: @autoclosure () async throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async where T : Comparable {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertGreaterThan(result1, result2, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertGreaterThanOrEqual<T>(_ expression1: @autoclosure () async throws -> T, _ expression2: @autoclosure () async throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async where T : Comparable {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertGreaterThanOrEqual(result1, result2, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertIdentical(_ expression1: @autoclosure () async throws -> AnyObject?, _ expression2: @autoclosure () async throws -> AnyObject?, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertIdentical(result1, result2, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertLessThan<T>(_ expression1: @autoclosure () async throws -> T, _ expression2: @autoclosure () async throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async where T : Comparable {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertLessThan(result1, result2, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertLessThanOrEqual<T>(_ expression1: @autoclosure () async throws -> T, _ expression2: @autoclosure () async throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async where T : Comparable {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertLessThanOrEqual(result1, result2, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertNil(_ expression: @autoclosure () async throws -> Any?, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async {
    await AssertExpressionEvaluator.evaluate({
        let result = try await expression()
        XCTAssertNil(result, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertNoThrow<T>(_ expression: @autoclosure () async throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async {
    do {
        let _ = try await expression()
        XCTAssertNoThrow({}(), message(), file: file, line: line)
    } catch {
        XCTAssertNoThrow(try { throw error }(), message(), file: file, line: line)
    }
}

public func AsyncAssertNotEqual<T>(_ expression1: @autoclosure () async throws -> T, _ expression2: @autoclosure () async throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async where T : Equatable {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertNotEqual(result1, result2, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertNotEqual<T>(_ expression1: @autoclosure () async throws -> T, _ expression2: @autoclosure () async throws -> T, accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async where T : FloatingPoint {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertNotEqual(result1, result2, accuracy: accuracy, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertNotEqual<T>(_ expression1: @autoclosure () async throws -> T, _ expression2: @autoclosure () async throws -> T, accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async where T : Numeric {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertNotEqual(result1, result2, accuracy: accuracy, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertNotIdentical(_ expression1: @autoclosure () async throws -> AnyObject?, _ expression2: @autoclosure () async throws -> AnyObject?, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async {
    await AssertExpressionEvaluator.evaluate({
        let result1 = try await expression1()
        let result2 = try await expression2()
        XCTAssertNotIdentical(result1, result2, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertNotNil(_ expression: @autoclosure () async throws -> Any?, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) async {
    await AssertExpressionEvaluator.evaluate({
        let result = try await expression()
        XCTAssertNotNil(result, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}

public func AsyncAssertThrowsError<T>(_ expression: @autoclosure () async throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line, _ errorHandler: (_ error: Error) -> Void = { _ in }) async {
    do {
        let _ = try await expression()
        XCTAssertThrowsError({}(), message(), file: file, line: line)
    } catch {
        XCTAssertThrowsError(try { throw error }(), message(), file: file, line: line)
    }
}

public func AsyncAssertTrue(_ expression: @autoclosure () async throws -> Bool,
                            _ message: @autoclosure () -> String = "",
                            file: StaticString = #filePath,
                            line: UInt = #line) async {
    await AssertExpressionEvaluator.evaluate({
        let result = try await expression()
        XCTAssertTrue(result, message(), file: file, line: line)
    },
                                             message(),
                                             file: file,
                                             line: line)
}
