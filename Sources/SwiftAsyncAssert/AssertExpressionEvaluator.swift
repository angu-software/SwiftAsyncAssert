//
//  AssertExpressionEvaluator.swift
//  
//
//  Created by Andreas Guenther on 11.08.23.
//

import XCTest

enum AssertExpressionEvaluator {
    
    static func evaluate(_ expression: () async throws -> Void,
                         _ message: @autoclosure () -> String = "",
                         function: StaticString = #function,
                         file: StaticString = #filePath,
                         line: UInt = #line,
                         failureEvaluation: (String, StaticString, UInt) -> Void = { XCTFail($0, file: $1, line: $2) }) async {
        do {
            try await expression()
        } catch {
            failureEvaluation(ThrownErrorFormatter.formattedStringForThrownError(error,
                                                                                 in: "\(function)",
                                                                                 message: message()),
                              file,
                              line)
        }
    }
}
