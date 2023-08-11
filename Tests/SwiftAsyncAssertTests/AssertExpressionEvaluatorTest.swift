//
//  AssertExpressionEvaluatorTest.swift
//  
//
//  Created by Andreas Guenther on 11.08.23.
//

import XCTest

@testable import SwiftAsyncAssert

final class AssertExpressionEvaluatorTest: XCTestCase {

    func test_should_succeed_when_evaluated_expression_executes_successfully() async throws {
        var isFailurePromptCalled = false

        AssertExpressionEvaluator.failurePrompt = { _, _, _ in
            isFailurePromptCalled = true
        }

        await AssertExpressionEvaluator.evaluate({
            // Here gets code executed that does not throw an error
        })

        XCTAssertFalse(isFailurePromptCalled)
    }

    func test_should_fail_when_evaluated_expression_throws_error() async throws {
        var isFailurePromptCalled = false

        AssertExpressionEvaluator.failurePrompt = { _, _, _ in
            isFailurePromptCalled = true
        }

        await AssertExpressionEvaluator.evaluate({
            throw TestingError.systemFailedToWork
        })

        XCTAssertTrue(isFailurePromptCalled)
    }
}
