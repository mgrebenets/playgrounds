//: Playground - noun: a place where people can play

import UIKit

let range = 0...9

for i in 0...9 {
    for j in 0...3 {

    }
}

let blackList = (0...9).flatMap { digit -> [String] in
    let lengthRange = 0...3
    return [
        lengthRange.reduce("") { r, v in r + "\(digit)" },
        lengthRange.reduce("") { r, v in r + "\((digit + v) % 10)" },
        lengthRange.reduce("") { r, v in r + "\((digit + 3 - v) % 10)" }
    ]
}

blackList
blackList.count
print(blackList)

//let digits = "0123456789"
//digits.characters.flatMap { d in
//    ["\(d)\(d)\(d)\(d)", "\(d)\(d + 1)\(d + 2)\(d + 3)", ""]
//}
