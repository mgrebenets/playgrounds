//: Playground - noun: a place where people can play

import UIKit

class Analytics {
    var provider: AnalyticsProvider!

    func doSomething() {
        // provider value is implicitly unwrapped and doesn't need ! to access it
        provider.normalFunc()
        // provider TYPE unlike value is still optional (AnalyticsProvider! / ?) and we
        provider!.dynamicType.staticFunc()
        provider.dynamicType
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
print(a.dynamicType)    // ImplicitlyUnwrappedOptional<A>
print(a!.dynamicType)   // A

a.dynamicType.f()   // error: type 'A!' has no member 'f'
a!.dynamicType.f()  // ok