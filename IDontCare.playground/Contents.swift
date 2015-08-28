//: Playground - noun: a place where people can play

import Foundation

func say(subject: String) -> String {
    return "You have no idea how little, not much, I care about \(subject) right now."
}

let subjects = ["BT customers", "BT DRM", "branch history", "branch names"]
let quotes = subjects.map(say)
print(quotes)

