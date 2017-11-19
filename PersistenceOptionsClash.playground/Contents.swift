//: Playground - noun: a place where people can play

import UIKit

//extension String {
//
//    // Make the first character as upper case for lower case string e.g "john" as "John"
//    func pascalCaseString() -> String {
//        guard !self.isEmpty else { return self }
//        return lowercaseString.stringByReplacingCharactersInRange(lowercaseString.startIndex...lowercaseString.startIndex, withString: String(lowercaseString[lowercaseString.startIndex]).uppercaseString)
//    }
//}
//
//// Macking String's methods avaialble in Objective-C
//
//extension NSString {
//    func pascalCaseNSString() -> NSString {
//        return String(self).pascalCaseString()
//    }
//}
//
//
//"JOHN DOE".pascalCaseString()

let lowercase = "JOHN DOE".lowercaseString
lowercase.stringByReplacingCharactersInRange(lowercase.startIndex...lowercase.startIndex, withString: String(lowercase[lowercase.startIndex]).uppercaseString)