//: Playground - noun: a place where people can play

import Foundation

let s = "123456789"

s.components(separatedBy: "")

let p = s.characters.reduce("") { $0 + " " + String($1) }
let q = s.characters.reduce("") { [$0, String($1)].joined(separator: " ") }
print(p)
print(s)