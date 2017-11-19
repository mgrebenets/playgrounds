//: Playground - noun: a place where people can play

import UIKit


extension ErrorType {

    // Error domain
    var domain: String { return "ServiceErrorDomain" }

    /// Error localised title
    var title: String { return "defaultTitle" }

    /// Error localised message
    var message: String { return "defaultMessage" }
}

enum AuthenticationError: ErrorType {
    case error1
    case error2

    var message: String {
        switch self {
        case .error1: return "error1"
        case .error2: return "error2"
        }
    }
}

AuthenticationError.error1.message
AuthenticationError.error2.message

extension AuthenticationError {
    var message: String {
        return "x"
    }
}

extension AuthenticationError {

}


print("x")
