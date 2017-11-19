//: Playground - noun: a place where people can play

import UIKit

var letters = ["a", "c", "b", "f", "t", "s"]
var sorted = letters.sorted { _,_ in return true }
print(sorted)

print(letters.sorted())

print([1, 2, 1, 2].sorted(by: { _ in return true }))
print([1, 2, 1, 2].sorted(by: { _ in return false }))

print([1, 2, 3,  1, 2].sorted(by: { _ in return true }))

print([1, 3, 2, 3, 1, 3, 2].sorted(by: { _ in return true }))


print("sorted".characters.sorted(by: { _ in return true }))