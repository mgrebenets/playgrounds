//: Playground - noun: a place where people can play

import Foundation

struct Account {}

// Optional Array
class CustomerA {
    var accounts: [Account]?
}

// Empty Array
class CustomerB {
    var accounts: [Account] = []
}

let customerA = CustomerA()

customerA.accounts == nil
customerA.accounts?.count
customerA.accounts?.isEmpty

customerA.accounts?.count ?? 0
customerA.accounts?.isEmpty ?? false


let customerB = CustomerB()

customerB.accounts.count
customerB.accounts.isEmpty