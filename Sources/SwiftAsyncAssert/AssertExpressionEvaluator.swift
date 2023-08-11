//
//  AssertExpressionEvaluator.swift
//  
//
//  Created by Andreas Guenther on 11.08.23.
//

import XCTest

enum AssertExpressionEvaluator {

    /// Evaluated in case an evaluated expression throws an error
    static var failurePrompt: (String, StaticString, UInt) -> Void = { XCTFail($0, file: $1, line: $2) }

    static func evaluate(_ expression: () async throws -> Void,
                  _ message: @autoclosure () -> String = "",
                  function: StaticString = #function,
                  file: StaticString = #filePath,
                  line: UInt = #line) async {
        do {
            try await expression()
        } catch {
            Self.failurePrompt(ThrownErrorFormatter.formattedStringForThrownError(error,
                                                                                  in: "\(function)",
                                                                                  message: message()),
                               file,
                               line)
        }
    }
}
