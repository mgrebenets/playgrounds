//: Playground - noun: a place where people can play

import Foundation


let error: Error? = NSError(domain: "abc", code: 3, userInfo: nil)

if let error = error as? NSError {
    print(error)
}

if let error = (error as? NSError) {
    print(error)
}

print(error as? NSError)

//print(error as NSError)

print(error as NSError?)

if let error = error as NSError? {
    print(error)
}

if let error = (error as NSError?) {
    print(error)
}

if let error: NSError = (error as NSError?) {
    print(error)
}


//if let error: NSError? = error {
//    print(error)
//}

