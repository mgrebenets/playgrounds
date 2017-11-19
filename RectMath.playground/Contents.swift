//: Playground - noun: a place where people can play

import UIKit

let d: CGFloat = 5
var frame = CGRect(x: 10, y: 20, width: 30, height: 40)

var f2 = CGRect(x: 10, y: 20, width: 30, height: 40)
f2.origin.x += d
f2.origin.y += d
f2.size.width -= 2 * d
f2.size.height -= 2 * d

print(f2)

var f3 = CGRect(x: 10, y: 20, width: 30, height: 40)

f3 = CGRectInset(f3, d, d)
print(f3)


var f4 = CGRect(x: 10, y: 20, width: 30, height: 40)
f4.origin.x -= d
f4.origin.y -= d
f4.size.width += 2 * d
f4.size.height += 2 * d
print(f4)

var f5 = CGRect(x: 10, y: 20, width: 30, height: 40)
f5 = CGRectInset(f5, -d, -d)
print(f4)

