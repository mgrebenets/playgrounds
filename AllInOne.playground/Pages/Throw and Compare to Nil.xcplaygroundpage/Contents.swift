//: [Previous](@previous)

import Foundation

func f() throws {
    throw NSError()
}

func use() -> Bool {
    do {
        try f()
        return true
    } catch {
        return false
    }
}

let flag1 = use()
let flag2 = (try? f()) != nil

//: [Next](@next)
