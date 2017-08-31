//: [Previous](@previous)

import Foundation

class Analytics {
    var provider: AnalyticsProvider!

    func doSomething() {
        // provider value is implicitly unwrapped and doesn't need ! to access it
        provider.normalFunc()
        // provider TYPE unlike value is still optional (AnalyticsProvider! / ?) and we
        type(of: provider!).staticFunc()
        type(of: provider)
    }
}

protocol AnalyticsProvider: class {
    static func staticFunc()
    func normalFunc()
}

class A {
    static func f() {}
}

let a: A! = A()
print(type(of: a))    // ImplicitlyUnwrappedOptional<A>
print(type(of: a!))   // A

type(of: a).f()   // error: type 'A!' has no member 'f'
type(of: a!).f()  // ok

//: [Next](@next)
