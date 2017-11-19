//: [Previous](@previous)

import Foundation

enum StatusCode: Int {
    case one, two, three
}

struct Content {
    let statusCode: Int?
    let code: Int?
}

let c1 = Content(statusCode: 1, code: 1)
let c2 = Content(statusCode: nil, code: 1)

let a: Int? = nil
let b: Int? = 1

switch (a, b) {
case (let x?, _):
    print("x")
case (_, let y?):
    print("y")
default:
    print("default")
}
//: [Next](@next)
