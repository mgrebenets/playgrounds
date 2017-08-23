//: Playground - noun: a place where people can play

import Foundation
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let nc = NotificationCenter.default
enum N {
    case a, b, c(String)
}

let n = NSNotification(name: NSNotification.Name(rawValue: "a"), object: N.c("xy"), userInfo: nil)

let s = nc.addObserver(forName: NSNotification.Name(rawValue: "a"), object: nil, queue: nil) { n in
    print(n)
    print(n.object as! N)
    if let u = n.object as? N {
        print(u)
        switch u {
        case .a: print("case a")
        case .b: print("case b")
        case .c (let string): print("case c: \(string)")
        }
    } else {
        print("no luck")
    }
}

nc.post(n as Notification)

