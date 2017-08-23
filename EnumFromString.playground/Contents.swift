//: Playground - noun: a place where people can play

import UIKit

enum Category: String {
    case diningOut  // "diningOut" is default
    case groceries
    case shopping
}

let c = Category(rawValue: "diningOut")
print(c!)   // diningOut

let c2 = Category(rawValue: "diningOutTypo")
print(c2)   // nil

