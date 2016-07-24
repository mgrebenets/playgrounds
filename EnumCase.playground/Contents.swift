//: Playground - noun: a place where people can play

import UIKit

/// Caseless enum
enum ConstantsEnum {
    /// Static constant
    static let title = "title"
}

let string = "stirngValue"

switch "stringValue" {
case ConstantsEnum.title:   // Compile error here
    print("enum")
default:
    print("other value")
}
