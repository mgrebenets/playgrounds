//: Playground - noun: a place where people can play

import Foundation

let score = 44

func grade(score: Int) -> String {
    switch score {
    case 0...60: return "F"
    case 61...70: return "D"
    case 71...80: return "C"
    case 81...90: return "B"
    default: return "E"
    }
}

print(grade(44))
print(grade(60))
print(grade(61))
print(grade(100))
