//: [Previous](@previous)

import Foundation

let dic = [1: "abc", 2: "bcd"]

dic.values
print(dic.values)
Array(dic.values)
print(Array(dic.values))

let array = ["abc", "123", "999"]
let dic2 = array.flatMap { [$0: $0] }
print(dic2)
print(dic2.dynamicType)

//: [Next](@next)
