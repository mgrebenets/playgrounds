//: [Previous](@previous)

import Foundation

let cal = Calendar(identifier: .gregorian)
cal.firstWeekday    // 1
cal.range(of: .weekday, in: .weekOfMonth, for: Date())  // Range 1..<8

cal.weekdaySymbols

//cal.

//: [Next](@next)
