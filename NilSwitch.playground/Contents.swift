//: Playground - noun: a place where people can play

import UIKit

let payload: [String: AnyObject] = ["bsb": "1234", "accountNumberWithoutBSB": "888"]
//let payload: [String: AnyObject] = ["bsb": "1234"]
//let payload: [String: AnyObject] = ["accountNumberWithoutBSB": "888"]
//let payload: [String: AnyObject] = [:]
let bsb = payload["bsb"] as? String

let n: String

switch(bsb, payload["accountNumberWithoutBSB"] as? String) {
case (nil, let value):
    print("bsb: no, number: \(value)")
case (_, nil):
    print("bsb: yes, number: no")
case (_, let value?):
    print("bsb: yes, number: yes")
}

print("x")
