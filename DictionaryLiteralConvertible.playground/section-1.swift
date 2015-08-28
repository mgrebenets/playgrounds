// Playground - noun: a place where people can play

import Foundation

/// Timeout Options
struct Options {
    let timeout: Double = 1 // timeout in seconds
    let message = "Timeout failed."    // message to display on timeout
}

/// Wait for something with timeout options
func wait(options: Options) {
    println("Waiting for \(options.timeout). Message: \(options.message)")
    // TODO: wait for some condition
}

enum OptionKey {
    case Timeout, Message
}

extension Options: DictionaryLiteralConvertible {
    typealias Key = OptionKey
    typealias Value = AnyObject

    init(dictionaryLiteral elements: (Key, Value)...) {
        for (key, value) in elements {
            switch key {
            case .Timeout: timeout = value as Double
            case .Message: message = value as String
            }
        }
    }
}

wait(Options(timeout: 0.1, message: "Custom timeout failed."))

wait([.Timeout: 0.1])
wait([.Timeout: 0.1, .Message: "Custom timeout failed."])
