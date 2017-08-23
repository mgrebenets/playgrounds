//: Playground - noun: a place where people can play

import UIKit

let s = "2.45"
var f = NSNumberFormatter()
f.numberStyle = .CurrencyStyle
//f.decimalSeparator = "."
f.currencyCode = ""
f.currencySymbol = ""
f.currencyDecimalSeparator = "."
f.currencyGroupingSeparator = ","
f.locale = NSLocale.currentLocale()
let n = f.numberFromString(s)
let sn = f.stringFromNumber(NSNumber(double: 2.45))
print(n)
print(n?.doubleValue)
print(n?.stringValue)