//: [Previous](@previous)

import Foundation

func brickWeight() -> Double {
    return 1 + brickWeight() / 2
}

let w = brickWeight()
print(w)

//: [Next](@next)
