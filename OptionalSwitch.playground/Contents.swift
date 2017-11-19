//: Playground - noun: a place where people can play

import UIKit


let magicID: String? = ""
let rollingKey: String? = ""

switch (magicID, rollingKey) {
case (.None, .None), (.None, _), (_, .None):
    print("some missing nil")
default:
    print("default")
}

switch (magicID, rollingKey) {
case let (a?, b?):
    print("some missing nil")
default:
    print("default")
}