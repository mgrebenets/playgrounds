//: Playground - noun: a place where people can play

import UIKit

let array = [1, 2, 3]

// Wrong
array.map {$0}
array.map { $0}

// Right
array.map { $0 }


// Wrong
[1].flatMap { String.init($0) }

// Right
[1].flatMap { String(describing: $0) }

// Wrong

// Jeez! Could you piss off with that rule of yours!?

// Right

//  Copyright (c) 2017 Commonwealth Bank. All rights reserved.

// Wrong
let a =  1    // OMG, why and how? 😭
let b  = 2
let c=3
let x = a/2 - b/2*c

// Right
let d = 4
let y = a / 2 - b / 2 * c
let z = (a / 2) - (b / 2 * c)

let range = 1..<2


let json = ["a": "josh"]

// Wrong
let coalescedName = json["name"] ?? nil

// Right
let name = json["name"]

public enum Rule {}

// Wrong
public func ==(lhs: Rule, rhs: Rule) -> Bool {
    return false
}

// Right
//public func == (lhs: Rule, rhs: Rule) -> Bool {
//    return false
//}
