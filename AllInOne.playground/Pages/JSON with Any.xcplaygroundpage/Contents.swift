//: [Previous](@previous)

import Foundation

typealias JSON = [String: Any]
struct Result {
    let value: JSON
}

let r = Result(value: ["a": "a", "one": 1])
let s = (r.value["A"] ?? r.value["a"]) as? String

let s2 = r.value["A"] as? String ?? r.value["a"] as? String

//: [Next](@next)
