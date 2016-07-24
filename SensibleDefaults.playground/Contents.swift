//: Playground - noun: a place where people can play

import UIKit

// Model

struct Address {
    let line1: String
    let line2: String?
    let city: String
    let state: String
    let postcode: String
    let country: String
}

// "Payload builder"
let address = Address(line1: "Darling Harbour 1",
                      line2: nil,
                      city: "Sydney",
                      state: "NSW",
                      postcode: "2232",
                      country: "Australia")

// View controller

if let line2 = address.line2 where !line2.characters.isEmpty {
    print("line 2 is not empty")
}

let l = address.line2 ?? ""
if l.characters.isEmpty {
    print("line 2 is empty")
}




//struct Address {
//    let line1: String
//    let line2: String
//    let city: String
//    let state: String
//    let postcode: String
//    let country: String
//}
//
//// "Payload builder"
//
//let payload = ["line2": "something"]
//
//let address = Address(line1: "Darling Harbour 1",
//                      line2: payload["line2"] ?? "",
//                      city: "Sydney",
//                      state: "NSW",
//                      postcode: "2232",
//                      country: "Australia")
//
//// View controller
//
//if !address.line2.characters.isEmpty {
//    print("line 2 is not empty")
//}
//
//if address.line2.characters.isEmpty {
//    print("line 2 is empty")
//}