//: Playground - noun: a place where people can play

import Foundation

var count: Int?

var inc = count.map { $0 + 1}
print(inc)

count = 1
inc = count.map { $0 + 1}
print(inc)
