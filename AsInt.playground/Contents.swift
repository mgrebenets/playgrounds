//: Playground - noun: a place where people can play

import UIKit

let d: [String: Any] = ["key": "5"]

let x = d["key"] as? String
let y = (d["key"] as? AnyObject)?.integerValue ?? 0


let i: Int? = 5

var p: [String: Any] = [:]
p["i"] = (i as? AnyObject)
p
print(p)


(Optional(5) as? AnyObject)
(Optional(5) as? AnyObject)?.integerValue

let j
if let p = p["i"] as? Int {
    j = p
} else {

}