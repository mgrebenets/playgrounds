//: Playground - noun: a place where people can play

import UIKit

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


enum Weekday: String {
    case mon, tue, wed
}

let d: [String: Weekday] = ["a": .mon, "b": .tue]

typealias JSON = [String: AnyObject]
let p: JSON = d.reduce([:]) { acc, entry -> JSON in
    return acc.merged(with: [entry.0: entry.1.rawValue as AnyObject])
}
p

struct StudentInfo {
    var count: Int
    var weekday: Weekday?
}

var studentsInfo: [String: StudentInfo] = [
    "a": StudentInfo(count: 0, weekday: nil),
    "b": StudentInfo(count: 100, weekday: .mon),
]


studentsInfo["c"]?.weekday = nil
studentsInfo
studentsInfo["b"]?.weekday = nil
studentsInfo
studentsInfo["a"]?.weekday = .tue
studentsInfo



