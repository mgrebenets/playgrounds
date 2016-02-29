//: Playground - noun: a place where people can play

import Foundation

let array = [1, 2, 3, 4, 5, 6, 7, 8]
let mappedArray = array.flatMap { element in
    element % 2 == 0 ? element : nil
}
