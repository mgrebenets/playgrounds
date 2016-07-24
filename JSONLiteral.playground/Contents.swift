//: Playground - noun: a place where people can play

import UIKit

let dic: [String: AnyObject] = ["key": "value"]
let dic2 = ["x": dic["key"], "w": nil, "y": dic["y"] ?? nil, "z": nil]


let x: Int? = nil
let y: Int? = nil

switch (x, y) {
case let (a?, b?):
    print("a")
    print(a)
    print(b)
default:
    print("default")
}