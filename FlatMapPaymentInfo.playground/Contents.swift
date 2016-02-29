//: Playground - noun: a place where people can play

import UIKit

let response = [ "details": [
        ["key1": "value1"],
        "arr_value1"
    ]
]

let f0 = response["details"]
f0
let f1 = response["details"].flatMap { $0 }

f1

let f2 = f1.map { $0 as? NSDictionary }
f2

struct Bill {
    var billerName: String?
    var billerNickName: String?
}

var bill = Bill()
bill.billerName = "name"
bill.billerNickName = "aa"

let x = bill.billerNickName?.characters.count > 0 ? bill.billerNickName : bill.billerName
x

