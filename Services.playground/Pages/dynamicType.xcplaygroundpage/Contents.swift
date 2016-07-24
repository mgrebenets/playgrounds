//: [Previous](@previous)

import Foundation

// Non-Static

protocol A {
    var services: [B] { get }
    func registerServices()
}

protocol B {
    func register()
}

extension A {
    func registerServices() {
        services.forEach { $0.register() }
    }
}

// Static

protocol SA {
    static var services: [SB] { get }
    static func registerServices()
}

protocol SB {
    static func register()
}

extension SA {
    static func registerServices() {
        // This is just a first small bit which is tricky to figure out initially
        services.forEach { $0.dynamicType.register() }
    }
}

print("Done")

//: [Next](@next)
