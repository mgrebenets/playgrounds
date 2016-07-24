// Playground - noun: a place where people can play

import UIKit

let array: [Double?] = [5.0, 6.0, .None, .None]

let r = array.flatMap { $0 }.reduce(0, combine: +)
print(r)

let dic: [String: Int] = ["a": 1]

let keys = dic.keys

let k = dic.map { $0.0 }