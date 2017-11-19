//: [Previous](@previous)

import Foundation

//let string = "http://nsbogan.com.au/myblog.html"
//let string = "https://developer.apple.com/documentation/foundation/nsstring/1411946-addingpercentencoding"
//let string = "https://www.google.com.au/search?q=sdfas+d  asf&oq=sdfas+dasf&aqs=chrome..69i57.2815j0j4&sourceid=chrome&ie=UTF-8"
//let string2 = "q=sdfas+d  asf&oq=sdfas+dasf&aqs=chrome..69i57.2815j0j4&sourceid=chrome&ie=UTF-8"
//let string = "cba.commbank.phone://products/listing?name=Home Loan&path=mobile-sales-framework/product-catalog/accounts/v1-0/content.js"

let string = "mobile-sales-framework product-catalog accounts/v1-0/content.js"
//let string = "q=sdfas+dasf&oq=sdfas+dasf&aqs=chrome..69i57.2815j0j4&sourceid=chrome&ie=UTF-8"


extension CharacterSet {
    static let urlAllowed = CharacterSet.urlFragmentAllowed
        .union(.urlHostAllowed)
        .union(.urlPasswordAllowed)
        .union(.urlQueryAllowed)
        .union(.urlUserAllowed)
}

let encoding = CFStringBuiltInEncodings.UTF8.rawValue
let s1 = CFURLCreateStringByAddingPercentEscapes(nil, string as CFString!, nil, "!*'\"();:@&=+$,/?%#[]% " as CFString!, encoding) as String

let s2 = string.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'\"();:@&=+$,/?%#[]% ").inverted)!
let s3 = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
let s4 = string.addingPercentEncoding(withAllowedCharacters: .urlAllowed)!

let u1 = URL(string: s1)!
let u2 = URL(string: s2)!
let u3 = URL(string: s3)!
let u4 = URL(string: s4)!

let q1 = u1.query
let q2 = u2.query
let q3 = u3.query
let q4 = u4.query

func queries(url: URL) -> [String: Any] {
    let query = url.query
    for param in query?.components(separatedBy: "&") ?? [] {
        print(param)
    }

    return [:]
}

queries(url: u1)
queries(url: u2)
queries(url: u3)
queries(url: u4)

s1 == s2
s1 == s3
s1 == s4

//let f = "cba.commbank.phone://products/listing?name=Home Loan&path=mobile-sales-framework/product-catalog/accounts/v1-0/content.js"
//let f2 = f.addingPercentEncoding(withAllowedCharacters: .url)

//: [Next](@next)
