//: Playground - noun: a place where people can play

import UIKit


public struct Capability: OptionSetType {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }

    static let none = Capability(rawValue: 0)
    static let one = Capability(rawValue: 2)
    static let two = Capability(rawValue: 4)
}

let c: Capability = [.one, .two]
c.contains(.none)


let c1: Capability = [.one]
c1 == .none
c1 == .one
c1 == .two