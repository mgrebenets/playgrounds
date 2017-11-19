//: [Previous](@previous)

import UIKit

var frame = CGRect(x: 5, y: 10, width: 30, height: 40)
let pos = CGPoint(x: 3, y: 7)

let f2 = frame.offsetBy(dx: -frame.origin.x + pos.x, dy: -frame.origin.y + pos.y)
frame.offsetBy(dx: -frame.origin.x + pos.x, dy: -frame.origin.y + pos.y)
print(frame)
//let p2 = pos.
frame.offsetBy(dx: -frame.minX + pos.x, dy: -frame.minY + pos.y)
print(frame)
//frame.origin = pos


//: [Next](@next)
