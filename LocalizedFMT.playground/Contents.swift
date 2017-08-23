//: Playground - noun: a place where people can play

import UIKit

let format = NSLocalizedString("key-with-%@-%@", value: "%1$@ then %2$@", comment: "")
let s = String.localizedStringWithFormat(format, "a", "b")

let format2 = NSLocalizedString("key-with", value: "%2$@ then %1$@", comment: "")
let s2 = String.localizedStringWithFormat(format2, "a", "b")
let s3 = String(format: format2, "a", "b")
let s4 = String(format: format, "a", "b")
let s5 = NSString(format: format2 as NSString, "a", "b", "c")
let s6 = String(format: "%2$@ then %1$@", format)