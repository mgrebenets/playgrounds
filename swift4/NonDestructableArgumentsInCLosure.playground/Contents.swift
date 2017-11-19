//: Playground - noun: a place where people can play

import UIKit

public func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
    var components: [(String, String)] = []

    if let dictionary = value as? [String: Any] {
        for (nestedKey, value) in dictionary {
            components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
        }
    } else if let array = value as? [Any] {
        for value in array {
            components += queryComponents(fromKey: "\(key)[]", value: value)
        }
    } else if let value = value as? NSNumber {
//        if value.isBool {
//            components.append((escape(key), escape((value.boolValue ? "1" : "0"))))
//        } else {
            components.append((escape(key), escape("\(value)")))
//        }
    } else if let bool = value as? Bool {
        components.append((escape(key), escape((bool ? "1" : "0"))))
    } else {
        components.append((escape(key), escape("\(value)")))
    }

    return components
}

public func escape(_ string: String) -> String {
    return string
}

private typealias Components = [(key: String, value: String)]

func query(_ parameters: [String: Any]) -> String {
    let components: Components = parameters.keys.sorted(by: <).reduce(Components()) { result, key  in
        let value = parameters[key]!    // swiftlint:disable:this
        return result + queryComponents(fromKey: key, value: value)
    }
    return components.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
}

let parameters = [
    "a": "1",
    "b": "string"
]

let q = query(parameters)
print(q)
