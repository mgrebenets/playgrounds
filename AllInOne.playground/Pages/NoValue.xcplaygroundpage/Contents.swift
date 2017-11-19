//: [Previous](@previous)

import Foundation

dump(Void.self)

typealias NoValue = ()

let nothing: Void = Void()

Never.self

let n = Never()

Void()

dump(NoValue())

()
("a", "b")
let t = (a: "a", b: "b", (1, d: 2))
t.a
t.b
t.2
t.0
t.1
t.2.1
t.2.d

struct S {
    let a = "a"
    let b = "b"
}

let s = S()
s.a
s.b

let d = ["a": 1, "b": 2]
d["a"]
d["b"]

//: [Next](@next)
