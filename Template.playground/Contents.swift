//: Playground - noun: a place where people can play

import UIKit

class X<T: Integer> {
    func p(v: T) {
        if type(of: v) == Int64.self {
            print("dsdasa")
        }
        print(v + 1)
    }

}

let x = X<Int64>()
x.p(v: 10)


func z(v: Int64) {}
func z(v: Int8) {}

let y: Int8 = 0
z(v: y)