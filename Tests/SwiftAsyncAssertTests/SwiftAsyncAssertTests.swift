//
//  SwiftAsyncAssertTests.swift
//  
//
//  Created by Andreas Guenther on 11.08.23.
//

import XCTest

@testable import SwiftAsyncAssert

final class SwiftAsyncAssertTests: XCTestCase {

    func test_should_pass_AsyncAssert() async throws {
        await AsyncAssert(await expr { true })
    }

    func test_should_pass_AsyncAssertTrue() async throws {
        await AsyncAssertTrue(await expr { true })
    }

    func test_should_pass_AsyncAssertFalse() async throws {
        await AsyncAssertFalse(await expr { false })
    }

    func test_should_pass_AsyncAssertEqual() async throws {
        await AsyncAssertEqual(await expr { true },
                               await expr { true })
    }

    func test_should_pass_AsyncAssertEqual_with_floating_point_accuracy() async throws {
        await AsyncAssertEqual(await expr { 0.2 },
                               await expr { 0.1 },
                               accuracy: 0.1)
    }

    func test_should_pass_AsyncAssertEqual_with_numeric_accuracy() async throws {
        await AsyncAssertEqual(await expr { 2 },
                               await expr { 1 },
                               accuracy: 1)
    }

    func test_should_pass_AsyncAssertNotEqual() async throws {
        await AsyncAssertNotEqual(await expr { true },
                                  await expr { false })
    }

    func test_should_pass_AsyncAssertNotEqual_with_floating_point_accuracy() async throws {
        await AsyncAssertNotEqual(await expr { 0.2 },
                                  await expr { 0.4 },
                               accuracy: 0.1)
    }

    func test_should_pass_AsyncAssertNotEqual_with_numeric_accuracy() async throws {
        await AsyncAssertNotEqual(await expr { 2 },
                                  await expr { 4 },
                               accuracy: 1)
    }

    func test_should_pass_AsyncAssertGreaterThan() async throws {
        await AsyncAssertGreaterThan(await expr { 2 },
                                     await expr { 1 })
    }

    func test_should_pass_AsyncAssertGreaterThanOrEqual() async throws {
        await AsyncAssertGreaterThanOrEqual(await expr { 2 },
                                            await expr { 1 })
        await AsyncAssertGreaterThanOrEqual(await expr { 2 },
                                            await expr { 2 })
    }

    func test_should_pass_AsyncAssertLessThan() async throws {
        await AsyncAssertLessThan(await expr { 1 },
                                  await expr { 2 })
    }

    func test_should_pass_AsyncAssertLessThanOrEqual() async throws {
        await AsyncAssertLessThanOrEqual(await expr { 1 },
                                            await expr { 2 })
        await AsyncAssertLessThanOrEqual(await expr { 1 },
                                            await expr { 1 })
    }

    func test_should_pass_AsyncAssertNil() async throws {
        let value: Bool? = nil
        await AsyncAssertNil(await expr { value })
    }

    func test_should_pass_AsyncAssertNotNil() async throws {
        let value: Bool? = false
        await AsyncAssertNotNil(await expr { value })
    }

    func test_should_pass_AsyncAssertIdentical() async throws {
        let object = SomeClass()

        await AsyncAssertIdentical(await expr { object },
                                   await expr { object })
    }

    func test_should_pass_AsyncAssertNotIdentical() async throws {
        let object1 = SomeClass()
        let object2 = SomeClass()
        
        await AsyncAssertNotIdentical(await expr { object1 },
                                      await expr { object2 })
    }

    func test_should_pass_AsyncAssertThrows() async throws {
        var isErrorHandlerCalled = false
        await AsyncAssertThrowsError(try await throwingExpr { throw TestingError.systemFailedToWork }) { error in
            XCTAssertEqual(error as? TestingError, .systemFailedToWork)
            isErrorHandlerCalled = true
        }

        XCTAssertTrue(isErrorHandlerCalled)
    }

    func test_should_pass_AsyncAssertNotThrows() async throws {
        await AsyncAssertNoThrow(try await throwingExpr { /*throw TestingError.systemFailedToWork*/ })
    }

    // MARK: Private

    private func expr<T>(_ expr: () -> T) async -> T {
        return expr()
    }

    private func throwingExpr<T>(_ expr: () throws -> T) async throws -> T {
        return try expr()
    }
}

private final class SomeClass {}
