//: Playground - noun: a place where people can play

import UIKit


let a: Int? = nil
let b: Int? = nil

switch (a, b) {
case let (a, b):
    print("both not nill")
case (let a, let b):
    print("b nil")
case (_, let b):
    print("a nil")
default:
    print("both nil")
}

//if let case

print("x")
