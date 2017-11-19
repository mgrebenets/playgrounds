//: [Previous](@previous)

import Foundation

let a = 1, b = 2
a
b
let nilAmount: String? = nil
let amount: String? = "15"

nilAmount.flatMap(String.init(describing:))
let v = amount.flatMap(String.init(describing:))

//String(amount)

v
dump(v)

//: [Next](@next)
