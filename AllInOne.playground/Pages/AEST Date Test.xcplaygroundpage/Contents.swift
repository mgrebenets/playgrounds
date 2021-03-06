//: [Previous](@previous)

import UIKit

let s = "17/04/2015 02:02 PM (AEST)"
let f = DateFormatter()
f.dateFormat = "dd/MM/yyyy hh:mm a '(AEST)'"
//f.dateFormat = "dd/MM/yyyy HH:mm a ZZZZZ"
//f.timeZone = NSTimeZone(abbreviation: "AEST")
//NSTimeZone(name: "AEST")
//NSTimeZone(abbreviation: "AEST")
//NSTimeZone(abbreviation: "AET")
//NSTimeZone(name: "AET")
//NSTimeZone(name: "EST")
//NSTimeZone(abbreviation: "EST")
//f.timeZone = NSTimeZone(forSecondsFromGMT: 0)
//NSTimeZone(forSecondsFromGMT: 10 * 60 * 60)
//f.timeZone = NSTimeZone(forSecondsFromGMT: 10 * 60 * 60)
//f.timeStyle
//f.locale = NSLocale.currentLocale()
f.locale = Locale(identifier: "en_US_POSIX")


f.timeZone = TimeZone.autoupdatingCurrent
f.timeZone

f.timeZone = TimeZone(abbreviation: "AEST")
f.timeZone


f.timeZone = NSTimeZone(name: "AET")! as TimeZone
f.timeZone
//f.timeZone = NSTimeZone(abbreviation: "GMT+10")
//f.timeZone
//f.timeZone = NSTimeZone(abbreviation: "UTC+10")
//f.timeZone

let l = NSTimeZone.local
l.description
l.abbreviation

//f.timeZone = NSTimeZoneNameStyle
//f.locale = NSLocale.currentLocale()
//f.locale = NSLocale(localeIdentifier: "en_AU")

//f.timeZone = NSTimeZone(abbreviation: "AEST")
//f.timeZone = NSTimeZone(name: "AEST")

let x = f.date(from: s)!

print(x)

//f.timeZone = NSTimeZone(name: "UTC+3")
f.timeZone
let y = f.string(from: x)
print(y)


let d = f.date(from: "")


//: [Next](@next)
