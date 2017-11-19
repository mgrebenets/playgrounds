// Playground - noun: a place where people can play

import Foundation


let s1 = "a\na\n"
print(s1)
print("---")
let r1 = s1.replacingOccurrences(of: "a\n$", with: "", options: .regularExpression, range: nil)
print(r1)
print("---")

let s2 = "a\n\n\n\n\n"
let r2 = s2.replacingOccurrences(of: "\n$", with: "", options: .regularExpression, range: nil)

"a\n\n\n".replacingOccurrences(of: "\n", with: "x", options: .regularExpression, range: nil)
"a\n\n\n\n\n".replacingOccurrences(of: "$", with: "x", options: .regularExpression, range: nil)
"a\n\n\n".replacingOccurrences(of: "\n$", with: "x", options: .regularExpression, range: nil)


