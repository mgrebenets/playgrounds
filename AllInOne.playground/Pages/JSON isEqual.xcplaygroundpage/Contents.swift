//: [Previous](@previous)

import Foundation

public typealias JSON = [String: Any]

public extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {

    public func isEqual(to other: JSON) -> Bool  {
        return NSDictionary(dictionary: self).isEqual(to: other)
    }
}


let j1: JSON = ["a": 1, "b": "B"]
let j2: JSON = ["a": 1, "b": "B"]
let j3: JSON = ["a": "1", "b": 2]

j1.isEqual(to: j2)
j1.isEqual(to: j3)

//: [Next](@next)
