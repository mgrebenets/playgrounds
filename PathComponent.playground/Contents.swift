//: Playground - noun: a place where people can play

import UIKit

let path = "abc.ext"
let url = URL(fileURLWithPath: path)
url.lastPathComponent
let last = url.deletingPathExtension().lastPathComponent

URL(string: "innovate/v0/summary/shit")?.lastPathComponent
URL(string: "innovate/v0/summary/shit")?.pathComponents.first

let c = "aB".caseInsensitiveCompare("ab")
dump(c)
c == .orderedSame

path


let e = FileManager.default.enumerator(atPath: ".")
let all = e!.allObjects
dump(all)
all as? [String]
type(of: e!.allObjects)
let p = (e!.allObjects) as? [String]
p
dump(e!.allObjects)
//e?.allObjects as? [String]

