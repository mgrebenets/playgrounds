//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Suite {
    case Spades, Clubs, Diamonds, Hearts
}

let suite = Suite.Spades;

reflect(Suite)
let x = reflect(Suite.Spades)
println(x)
println(x.value)
println(x.valueType)
//println(String(x.value))
println(x.summary)
println(x.value as? Suite)




