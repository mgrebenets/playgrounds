//: Playground - noun: a place where people can play

import UIKit

struct Task {
    let id: Int
}

let number = 0
let tasks = [Task(id: 1), Task(id: 2), Task(id: 3)]

let indexPaths = tasks.enumerated().map { index, task in
    NSIndexPath(row: index + 1, section: number)
}
print(indexPaths)