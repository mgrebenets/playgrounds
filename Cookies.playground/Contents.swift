//: Playground - noun: a place where people can play

import UIKit

let properties = [
    NSHTTPCookieDomain: "domain.com",
    NSHTTPCookiePath: "/",
    NSHTTPCookieName: "hallo",
    NSHTTPCookieValue: "xyz"
]


let cookie = NSHTTPCookie(properties: properties)!
NSHTTPCookieStorage.sharedHTTPCookieStorage().setCookie(cookie)
let cookies = NSHTTPCookieStorage.sharedHTTPCookieStorage().cookies!


let data: NSData = NSKeyedArchiver.archivedDataWithRootObject(cookies)

let extractedCookies = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [NSHTTPCookie]

print(extractedCookies)
