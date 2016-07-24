//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Model {
    let name: String
    var age: Int
    init(name: String, age: Int = 0) {
        self.name = name
        self.age = age
    }

    mutating func birthday(age: Int) {
        self.age = age
    }
}

var m = Model(name: "xxx")
//print(Unsam)

func nonMutating <T,U> (f: (inout T) -> U -> Void, _ t: T, _ u: U) -> T {
    var copy = t
    f(&copy)(u)
    return copy
}

Model.birthday
//Model.birthday(&m)

//let n: Model = nonMutating(Model.birthday(&m))

let s = "xxx"
let g = nonMutating(String.appendContentsOf, s, "abc")

let f = nonMutating(Model.birthday, m, 5)
print(f)
//let m5 = f(5)
//print(m5)
