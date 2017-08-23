//: Playground - noun: a place where people can play

import UIKit

func f1(x: Int, args: Int...) {
    print(args)
}

let all = [1, 2, 3]

func f2(x: Int, argsArr: [Int]) {
    print(argsArr)
}

f1(0)
f2(0, argsArr: [])
f1(0, args: all)