//: Playground - noun: a place where people can play

import UIKit


enum HelixAuthenticationLevel: String, Codable {

    /// Rolling key.
    case rollingKey = "urn:rk"

    /// Pin.
    case pin = "urn:pin"

    /// Password.
    case password = "urn:password"

    /// Temporary password.
    case tempPassword = "urn:temppassword"

    /// Anonymous.
    case anonymous = "urn:anonymous"

    /// Biometric.
    case biometric = "urn:biometric"

    static let allValues = [.rollingKey, .pin, .password, tempPassword, .anonymous, .biometric]
}

struct UserContext: Codable {

    /// Authentication level.
    let loa: HelixAuthenticationLevel

    /// Is stepped up.
    let isSteppedUp: Bool
}


let json: [String: Any] = ["loa": "urn:rk", "isSteppedUp": true]
let data = try JSONSerialization.data(withJSONObject: json, options: [])
let decoder = JSONDecoder()
let ctx = try decoder.decode(UserContext.self, from: data)
dump(ctx)
dump(ctx.loa)

let emptyJsonData = try JSONSerialization.data(withJSONObject: [:], options: [])
let ctx2 = try? decoder.decode(UserContext.self, from: emptyJsonData)
dump(ctx2)
print(ctx2)
