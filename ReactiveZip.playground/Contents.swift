//: Playground - noun: a place where people can play

import UIKit

let stream = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let streamTail = stream.dropFirst()

let zipped = zip(stream, streamTail)

zipped.forEach { tuple in
    print(tuple)
}
//print(zipped)
