//: Playground - noun: a place where people can play

import UIKit

let payload: [String: String] = ["bsb": "1234", "accountNumberWithoutBSB": "888"]
//let payload: [String: String] = ["bsb": "1234"]
//let payload: [String: String] = ["accountNumberWithoutBSB": "888"]
//let payload: [String: String] = [:]
let bsb = payload["bsb"]

let n: String

switch(bsb, payload["accountNumberWithoutBSB"]) {
case (nil, let value):
    print("bsb: no, number: \(value)")
case (_, nil):
    print("bsb: yes, number: no")
case (_, let value?):
    print("bsb: yes, number: yes")
}

print("x")


let x: Int? = nil
switch x {
//case nil: print("nil")
case let value: print("value: \(value)")
case let value?: print("value?: \(value)")
}