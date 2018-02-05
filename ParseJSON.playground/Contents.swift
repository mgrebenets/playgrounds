//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let payload = [
    "a": "1"
]

let data = try! JSONSerialization.data(withJSONObject: payload)

let json = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))

let s = "/*abcdefg*/"
let sd = s.data(using: .utf8)!

sd[0]
sd[1]
String(sd[0])
//Character(sd[0])
String(bytes: [sd[0]], encoding: .utf8)

data[0...1]
let prefix = sd.prefix(2)
let suffix = sd.suffix(2)

prefix.base64EncodedString()
String(data: prefix, encoding: .utf8)

sd.starts(with: "/*".data(using: .utf8)!)
data.starts(with: "/*".data(using: .utf8)!)

sd.lazy.reversed()
let r = "/*".reversed()
//puts(r)

sd.lazy.reversed().starts(with: "/*".data(using: .utf8)!)

let commentMarker = "/*".data


let j = try! JSONSerialization.jsonObject(with: Data(), options: .allowFragments)
j

