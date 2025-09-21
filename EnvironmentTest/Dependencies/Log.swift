//
//  Log.swift
//  EnvironmentTest
//
//  Created by Harshit Singh on 9/21/25.
//

import Foundation

enum Log {
    fileprivate enum LogLevel {
        case info
        case warning
        case error
        
        fileprivate var prefix: String {
            switch self {
            case .info:
                "INFO"
            case .warning:
                "WARN ⚠️"
            case .error:
                "ERROR ❌"
            }
        }
    }
    
    fileprivate struct Context {
        let file: String
        let function: String
        let line: Int
        
        var description: String {
            "\((file as NSString).lastPathComponent):\(line) \(function)"
        }
    }
    
    static func info(_ str: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func warning(_ str: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .warning, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func error(_ str: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .error, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    fileprivate static func handleLog(level: LogLevel, str: String, shouldLogContext: Bool, context: Context) {
        let logComponent = ["[\(level.prefix)]", str]
        
        var fullString = logComponent.joined(separator: " ")
        if shouldLogContext {
            fullString += " - \(context.description)"
        }
        
        #if DEBUG
        print(fullString)
        #endif
    }
}

