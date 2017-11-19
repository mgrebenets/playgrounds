//: [Previous](@previous)

import Foundation

let messages = ["a", "b", "c"]
let newMessages = ["a", "b", "c"]

//let indexPaths = messages.indices.map { IndexPath(row: $0, section: 0) }

let range = messages.endIndex ..< messages.endIndex.advanced(by: newMessages.count)
let indexPaths = range.indices.map { IndexPath(row: $0, section: 0) }

dump(indexPaths)

//: [Next](@next)
