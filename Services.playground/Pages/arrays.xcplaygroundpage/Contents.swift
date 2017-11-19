//: [Previous](@previous)

import Foundation


protocol P1 {
    static func p()
}

extension P1 {
    static func p() {
        print("P1.p()")
    }
}

class C1: P1 {
    init() {
        print("C1.init")
    }

    static func p() {
        print("C1.p()")
    }
}

class C2 {
    static func configure(providers: [P1]) {
        providers.forEach { $0.dynamicType.p() }
    }
}

//let accountsModule = AccountsModule.self as! ServiceProvider
//let providers = [accountsModule]

// Must specify [P1] type here so compiler knows this is array of things that conform to P1, not just AnyObject stuff
let providerA: P1 = C1()
//let providerA: P1= C1()
let providersA: [P1] = [providerA]
//let providersA = [providerA]
C2.configure(providersA)

print("---")
let providerB: P1 = C1()
let providersB: [P1] = [providerB]
//let providerB = C1.self() as! P1
//let providersB: [P1] = [providerB]

C2.configure(providersB)

print("Done")
//: [Next](@next)
