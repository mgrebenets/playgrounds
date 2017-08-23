//: Playground - noun: a place where people can play

import UIKit

extension NSDate {
    convenience init?(from string: String) {
        guard !string.isEmpty else { return nil }
        self.init()
    }
}

//guard let date = NSDate(from: "") as? Date else {
//    print("nil")
//}

if let date = NSDate(from: "") as Date? {
    print("not nil: ]\(date)")
} else {
    print("nil")
}

if let date = NSDate(from: "aaaabbbbccc") as Date? {
    print("not nil: \(date), type: \(type(of: date))")
} else {
    print("nil")
}


