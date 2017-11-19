//: [Previous](@previous)

import Foundation

let x = true, y = false, z = false

func completion(_ flag: Bool) {
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

//: [Next](@next)
