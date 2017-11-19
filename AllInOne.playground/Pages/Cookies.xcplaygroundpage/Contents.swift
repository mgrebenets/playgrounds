//: [Previous](@previous)

import Foundation

let properties = [
    HTTPCookiePropertyKey.domain: "domain.com",
    HTTPCookiePropertyKey.path: "/",
    HTTPCookiePropertyKey.name: "hallo",
    HTTPCookiePropertyKey.value: "xyz"
]


let cookie = HTTPCookie(properties: properties)!
HTTPCookieStorage.shared.setCookie(cookie)
let cookies = HTTPCookieStorage.shared.cookies!


let data: NSData = NSKeyedArchiver.archivedData(withRootObject: cookies) as NSData

let extractedCookies = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! [HTTPCookie]

print(extractedCookies)

//: [Next](@next)
