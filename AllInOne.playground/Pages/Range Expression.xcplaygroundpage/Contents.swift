//: [Previous](@previous)

import Foundation

enum Constants {
    static let deviceIDPrefix = "UR"
}

let storedValue = "UX123123123"
let range = storedValue.startIndex..<storedValue.index(storedValue.startIndex, offsetBy: Constants.deviceIDPrefix.count)
let newValue = storedValue.replacingCharacters(in: range, with: Constants.deviceIDPrefix)


//: [Next](@next)
