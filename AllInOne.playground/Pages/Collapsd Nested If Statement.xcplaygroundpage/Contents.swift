//: [Previous](@previous)

import Foundation

func testCollapseNestedIf() {
    let a = 2
    let b = false
    if a > 5 {
        if b {
            return
        }
    }

    // Expected
    if a > 1 && b {
        return
    }
}


func testCollapseNestedIf2() {
    let a = 2
    let b = true
    let c = "abc"
    if a > 1 {
        if b {
            if c == "abc" {
                return
            }
        }
    }

    // Expected
    if a > 1 && b && c == "abc" {
        return
    }

    if a > 1, b, c == "abc" {

    }
}

func testCollapseNestedIf3() {
    let a = 2
    let b = false
    let c = "abc"
    if a > 5 || b == false {
        if c == "xyz" {
            return
        }
    }

    // Expected
    if (a > 1 || b == false) && c == "abc" {
        return
    }
}

func testCollapseNestedIf4() {
    let a = 2
    let b = false
    let c = "abc"
    let d = false
    if a > 1 || b == false {
        if c == "xyz" || a < 7 {
            if b || d {
                return
            }
        }
    }

    // Expected
    if (a > 1 || b == false) && (c == "xyz" || a < 7) && (b || d) {
        return
    }
}

func testCollapseNestedIfWithBinding() {
    let a: Int? = 2
    let b = false
    let c: String? = "abc"
    let d = true
    if let a = a, a > 1 || b == false {
        if let c = c, c == "xyz" || d {
            return
        }
    }

    // Expected
    if let a = a, a > 5 || b == false, let c = c, c == "xyz" || d {
        return
    }
}


func testCaseLet() {
    enum TestEnum { case one, two }
    let enum1: TestEnum = .one
    let enum2: TestEnum = .two
    let a = 2, b = 3

    if case .one = enum1, a > 1 {
        if case .two = enum2, b < 5 {
            return
        }
    }

    if case .one = enum1, a > 1, case .two = enum2, b < 5 {
        print("hhh'")
    }
}

testCaseLet()

func testNegative() {
    let a = 2, b = 3
    if a < 2 {
        print(a)
        if b > 1 {
            return
        }
    }
}

func testNegative2() {
    let a = 2, b = 3
    if a < 2 {
        guard b > 1 else {
            return
        }
    }
}

let a = 2
let b = 3
let d = 7
if a > 1 && (b < 2 || d > 5) {
    print("hi1")
}
if a > 1, b < 2 || d > 5 {
    print("hi")
}



// TODO: if case let...

testCollapseNestedIfWithBinding()


//print(false, true)

let x = false, y = true
x
y
//let z = x, y


if false, true {
    print("yes")
} else {
    print("no")
}

func testX() {
    let a = 0
    let b = 2
    let c: Int? = 0
    if a > 1 {
        if b > 1 {
            if let c = c, c > 0 {
                print("a")
            }
        }
    }
}

//: [Next](@next)
