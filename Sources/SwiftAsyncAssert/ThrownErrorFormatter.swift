//
//  ThrownErrorFormatter.swift
//  
//
//  Created by Andreas Guenther on 11.08.23.
//

import Foundation

final class ThrownErrorFormatter {

    static func formattedStringForThrownError(_ error: Error, in function: String, message: String) -> String {
        // Format '<func name> failed: threw error "<error>" - <message>'
        return ["\(formatFunctionName(function)) failed: threw error \"\(error)\"",
                message]
            .filter({ $0.isEmpty == false })
            .joined(separator: " - ")
    }

    private static func formatFunctionName(_ functionName: String) -> String {
        return functionName.components(separatedBy: "(").first ?? functionName
    }
}
