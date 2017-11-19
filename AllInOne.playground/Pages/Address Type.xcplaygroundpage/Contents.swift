//: [Previous](@previous)

import UIKit

extension String {
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    var condensingWhitespaces: String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}


/// Merchant's address
struct Address {
    let line1: String
    let line2: String
    let city: String
    let state: String
    let postcode: String
    let country: String

    var domestic: String {
        let part1 = line1 + (line2.isEmpty ? "": ", \(line2)")
        let part2 = [city, state, postcode].joined(separator: " ").trimmed.condensingWhitespaces
        return part1 + (part2.isEmpty ? "" : "\n\(part2)")
    }
}


let a = Address(line1: "14/491", line2: "       President Ave", city: "Suthernalnd", state: "NSW", postcode: "2232", country: "Australia")
a.domestic
print(a.domestic)
let b = Address(line1: "14/491", line2: "President Ave", city: "     ", state: "dsfafads ", postcode: "22", country: "Australia")
print(b.domestic)
print("---")

//: [Next](@next)
