//: Playground - noun: a place where people can play

import UIKit

struct CustomerDetails {
    let addressLine1: String? = nil
    let city: String? = nil
    let state: String? = "STATE"
    let postCode: String? = nil
}

let customerDetails = CustomerDetails()
let finalAddress: String = [customerDetails.addressLine1, customerDetails.city, customerDetails.state, customerDetails.postCode].flatMap { $0 }.joined(separator: " ")
finalAddress