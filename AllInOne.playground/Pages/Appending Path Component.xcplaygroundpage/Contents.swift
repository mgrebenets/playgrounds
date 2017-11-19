//: [Previous](@previous)

import UIKit

let imagePath = "imagePath"
("/" as NSString).appendingPathComponent(imagePath)

let imagePath2 = "/imagePath"
("/" as NSString).appendingPathComponent(imagePath2)

("old/" as NSString).appendingPathComponent("/new")   // "old/new"
("old/" as NSString).appendingPathComponent("new")   // "old/new"

//: [Next](@next)
