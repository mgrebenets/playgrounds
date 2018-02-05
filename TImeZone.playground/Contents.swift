
//: Playground - noun: a place where people can play

import UIKit

func greet(_ name: String, _ day: Int, week: String, _ x: String) -> String {
    return "Hello \(name), today is \(day) \(week)."
}
greet("Bob", 3, week: "x", "xs")

func area(width: Int, height: Int) -> Int {
    return width * height
}

//#selector(area(width:height:))

let s = Selector("area(width:height:)")
area(width: 3, height: 3)


let l = Locale.current
let p = Locale(identifier: "en_US_POSIX")
let lAST = Locale(identifier: "AST")
let lAET = Locale(identifier: "AET")
let lAEST = Locale(identifier: "AEST")

TimeZone(abbreviation: "AET")
TimeZone(abbreviation: "AEST")
TimeZone(abbreviation: "AST")
let iAST = TimeZone(identifier: "AST")
iAST?.description
iAST?.abbreviation()
iAST.debugDescription
iAST?.localizedName(for: .standard, locale: nil)
iAST?.localizedName(for: .standard, locale: l)
iAST?.localizedName(for: .standard, locale: lAST)
iAST?.localizedName(for: .standard, locale: lAET)
iAST?.localizedName(for: .standard, locale: lAEST)
TimeZone(identifier: "AEST")

let iAET = TimeZone(identifier: "AET")
iAET?.localizedName(for: .standard, locale: l)

let iAus = TimeZone(identifier: "Australia/Sydney")
iAus?.localizedName(for: .standard, locale: l)

let oc = NSTimeZone(name: "AET")
oc?.localizedName(.standard, locale: l)

let oc2 = NSTimeZone(name: "Australia/Sydney")
oc2?.localizedName(.standard, locale: l)


TimeZone(secondsFromGMT: 0)
TimeZone.current
TimeZone.current.description

let sss = """
The multiline String
LOL
    """

