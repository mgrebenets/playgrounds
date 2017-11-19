//: Playground - noun: a place where people can play

import UIKit


protocol X: class {
    static func f(name: String)
}

extension X {
    static func f(name: String) {
        NSBundle(forClass: self)
    }
}

print("x")
