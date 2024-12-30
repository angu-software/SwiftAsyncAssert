//
//  AssertExpressionEvaluatorTest.swift
//  
//
//  Created by Andreas Guenther on 11.08.23.
//

import XCTest

@testable import SwiftAsyncAssert

final class AssertExpressionEvaluatorTest: XCTestCase {

    private var isFailurePromptCalled = false

    func test_should_succeed_when_evaluated_expression_executes_successfully() async throws {
        await AssertExpressionEvaluator.evaluate({
            // Here gets code executed that does not throw an error
        }, failureEvaluation: { _, _, _ in
            self.isFailurePromptCalled = true
        })

        XCTAssertFalse(isFailurePromptCalled)
    }

    func test_should_fail_when_evaluated_expression_throws_error() async throws {
        await AssertExpressionEvaluator.evaluate({
            throw TestingError.systemFailedToWork
        }, failureEvaluation: { _, _, _ in
            self.isFailurePromptCalled = true
        })

        XCTAssertTrue(isFailurePromptCalled)
    }
}
