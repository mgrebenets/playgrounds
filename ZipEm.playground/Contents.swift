//: Playground - noun: a place where people can play

import UIKit


let funds: [[String: AnyObject]]? = [ ["a": "b"], ["c": "d"], ["a": "b"]]
let balances: [[String: AnyObject]]? = [ ["x": "y"]]

let f = funds ?? []
let b = balances ?? []


let z = zip(f, b)

print(z)

let z2 = Zip2Sequence(f, b)

for x in z2 {
    print(x)
}

let a: [Int]? = nil
let c: [Int]? = nil

a?.count >= c?.count



print("x")
