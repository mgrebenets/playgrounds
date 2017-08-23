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


enum SegmentIndex {
    static let push: Int = 0
    static let email: Int = 1
}

func f(_ index: Int) -> Int {
    switch index {
    case SegmentIndex.push: return 100
    case SegmentIndex.email: return 200
    default: return 0
    }
}

f(0)