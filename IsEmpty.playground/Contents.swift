//: Playground - noun: a place where people can play

import UIKit

protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
    var isNilOrEmptyString: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}


let nilString:String? = nil
let emptyString:String? = ""
let someText:String? = "lorem"
nilString.isNilOrEmptyString   // true
emptyString.isNilOrEmptyString // true
someText.isNilOrEmptyString    // false
"".isEmpty
Optional.Some("")?.isEmpty

let view:UIView? = UIView()
//view.isNilOrEmptyString       // Compile error


