//: Playground - noun: a place where people can play

import UIKit



var s = String(repeating: "", count: 0)

for i in 0..<15 {
    let count = (s.characters.count + 1) % 4
    s = String(repeating: ".", count: count)
    print(s)
}