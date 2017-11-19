//: [Previous](@previous)

import Foundation

let date = Date()

let f = DateFormatter()
f.locale = Locale(identifier: "en_AU")
//f.locale = Locale(identifier: "en_US")
f.dateFormat = "EEE dd MMM yyyy"


let s = f.string(from: date)
print(s)

//: [Next](@next)
