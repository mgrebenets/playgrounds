//: [Previous](@previous)

import UIKit

let imagePath = "imagePath"
("/" as NSString).appendingPathComponent(imagePath)

let imagePath2 = "/imagePath"
("/" as NSString).appendingPathComponent(imagePath2)

("/" as NSString).appendingPathComponent("/path")   // "/path"
("/" as NSString).appendingPathComponent("path")   // "/path"

//: [Next](@next)
