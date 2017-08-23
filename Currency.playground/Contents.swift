//: Playground - noun: a place where people can play

import UIKit

let formatter = NumberFormatter()
formatter.numberStyle = .currency
formatter.currencyCode = "AUD"

for identifier in ["en_US", "en_AU", "fr_AU", "fr_FR", "en_FR", "ja_JP", "en_JP", "en_CN", "zh_CN"] {
    formatter.locale = Locale(identifier: identifier)
    print("\(identifier) \(formatter.string(from: 1234.5678))")
}

let localeID = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.currencyCode.rawValue: "JPY"])
let f2 = NumberFormatter()
f2.locale = Locale(identifier: localeID)
NSLocale(localeIdentifier: localeID).localeIdentifier
f2.currencySymbol
f2.numberStyle = .currency
print(localeID)
f2.string(from: 1234.5678)