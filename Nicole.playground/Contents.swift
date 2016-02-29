//: Playground - noun: a place where people can play

import Foundation

class Developer {}
class Nicole: Developer {
    func digitalActivation() -> Bool {
        return true
    }

    static func go() {}
}

//let nicole = Nicole()

let _ = Nicole.go()

class GoodFriend {
    let firstName: String
    let lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

let missingPerson = GoodFriend(firstName: "Nicole", lastName: "Lam")

let ironLady = [
    "Ni": "Nickel",
    "Co": "Cobalt",
    "Le": "Lead"
]

class Human {
    let properties: [String]
    init(properties: [String]) {
        self.properties = properties
    }
}

let nicole = Human(properties: ["Unicorns", "Baloons", "Rainbow", "Avocado"])

var commBank: [String: Bool] = [:]

commBank["Nicole"] = nil

