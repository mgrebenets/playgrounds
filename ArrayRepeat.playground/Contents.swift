//: Playground - noun: a place where people can play

import UIKit

let options = [1, 2, 3, 4]

let newOptions = options.flatMap { option in
    return Array(repeating: option, count: option.quantity)
}