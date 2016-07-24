// Playground - noun: a place where people can play

import UIKit


let x = true, y = false, z = false

func completion(flag: Bool) {
    print("completion: \(flag)")
}

func f() {


    if x {
        completion(false)
        return
    }

    // somethign

    completion(true)
}

f()

func f2() {
    var result = true
    defer {
        print("defer")
        completion(result)
    }

    guard !x else {
        result = false
        return
    }
}

f2()