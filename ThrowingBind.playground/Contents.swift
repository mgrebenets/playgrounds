//: Playground - noun: a place where people can play

import Foundation

enum Error: ErrorType {
    case Error
}

func bind<A, B>(a: A?, f: A throws -> B?) throws -> B? {
    if let a = a {
        return try! f(a)
    } else {
        throw Error.Error
    }
}

infix operator >>= { associativity left }
func >>=<A, B>(a: A?, f: A throws -> B?) throws -> B? {
    return try! bind(a, f: f)
}


func fpos(a: Int) throws -> Int {
    if a > 0 {
        return a
    } else {
        throw Error.Error
    }
}

func fneg(a: Int) throws -> Int {
    if a < 0 {
        return a
    } else {
        throw Error.Error
    }
}


//func fm(a: Int) -> Int {
//    return a + 2
//}
//
//let c: Int? = 2
//let cx = c.flatMap({ fm($0) })
//print(cx)
//
//let b: Int = 5
//print(b as Int?)
//
//let arr = [1, 2, 3]
//let fmx = arr.flatMap({ fm($0) })
//print(fmx)



do {
    let x = try 5 >>= fpos
    print(x)
} catch {
    print("error")
}

//do {
//    let x = try 11 >>= f1
//    print(x)
//} catch {
//    print("error")
//}

