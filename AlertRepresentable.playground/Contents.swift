//: Playground - noun: a place where people can play

import UIKit


/// Custom error convertible protocol
///
/// Types conforming to this protocol have basic properties of the error
/// such as error domain, code, message and title
public protocol CustomErrorConvertible {

    // MARK: - Properties

    /// Error domain
    var domain: String { get }

    /// Error code
    var code: Int { get }

    /// Localized error message
    var message: String { get }

    /// Localized error title
    var title: String { get }

    // MARK: - Initializers

    /// Initialize with error code and message
    init(code: Int, message: String)

    /// Initialize with `NSError`
    init(error: NSError)
}

/// Default implementation for `CustomErrorConvertible`
public extension CustomErrorConvertible {

    /// Default implementation with `NSError`
    init(error: NSError) {
        self.init(code: error.code, message: error.localizedDescription)
    }
}

/// Protocol for errors that can be presented in alert views
///
/// Alert representable error has following properties:
///
/// - Alert title
/// - Alert message
/// - Can contain external link in the message
/// - Can contain phone number in the message
public protocol AlertRepresentableError {

    /// Alert title
    var alertTitle: String { get }

    /// Alert message
    var alertMessage: String { get }

    /// Has external link
    var hasExternalLink: Bool { get }

    /// Has phone number
    var hasPhoneNumber: Bool { get }
}

/// Default implementation of `AlertRepresentableError` for any type conforming to `CustomErrorConvertible`
public extension AlertRepresentableError where Self: CustomErrorConvertible {

    /// Separator used in error message
    ///
    /// Can't use static stored properties in protocol extensions (yet)
    private var messageSeparator: String { return ":" }

    /// Extract the title from error message
    var alertTitle: String {
        guard let title = message.componentsSeparatedByString(messageSeparator).first else {
            // TODO: Max - create helper methods to simplify this code
            return "Error"
        }
        return title.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }

    /// Extract the alert message from the error message
    public var alertMessage: String {
        guard let text = message.componentsSeparatedByString(messageSeparator).last else {
            return message
        }
        return text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }

    /// Has external link
    var hasExternalLink: Bool {
        return message.hasExternalLink()
    }

    /// Has phone number
    var hasPhoneNumber: Bool {
        return message.hasPhoneNumber()
    }
}

/// String extension with NSError message helper methods
/// (aka one of the worst code in the history of mobile development)
private extension String {

    private enum MessageKeys {
        static let customerServicePhoneNumber = "13 2221"
        static let customerServiceMessage = "please call us"
        static let netbankWebsiteLink = "netbank.com.au"
    }

    /// Check if setring contains CBA extenal link
    private func hasExternalLink() -> Bool {
        return containsString(MessageKeys.netbankWebsiteLink)
    }

    /// Check if message contains CBA phone number
    private func hasPhoneNumber() -> Bool {
        return containsString(MessageKeys.customerServiceMessage) || containsString(MessageKeys.customerServiceMessage)
    }
}

public enum LoginError: ErrorType {
    case error
}

extension LoginError: CustomErrorConvertible {
    public var domain: String { return "LoginService" }

    /// Error title
    public var title: String {
        return "Login Error"
    }

    /// Error code
    public var code: Int {
        return 1
    }

    /// Error message
    public var message: String {
        return "Login error message"
    }

    /// Initialize withe error code and message
    public init(code: Int, message: String) {
        self = .error
    }
}

extension LoginError: AlertRepresentableError {

}