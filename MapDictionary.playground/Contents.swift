//: Playground - noun: a place where people can play

import Foundation

public extension Dictionary {

    /// Merge reciever with another dictionary.
    public mutating func merge(otherDictionary: [Key: Value]) {
        for (key, value) in otherDictionary {
            self[key] = value
        }
    }

    /// Create new dictionary by merging reciever with another dictionary.
    public func merged(with otherDictionary: [Key: Value]) -> [Key: Value] {
        var mergedDict: [Key: Value] = [:]
        [self, otherDictionary].forEach { dict in
            for (key, value) in dict {
                mergedDict[key] = value
            }
        }
        return mergedDict
    }
}


let dic = ["a": 1, "b": 2]
let r = dic.map { k, v in (String(k), v) }
r

let s = dic.reduce([:]) { (result, e) -> [String: Int] in
    return [String(e.key): e.value].merged(with: result)
}
s


