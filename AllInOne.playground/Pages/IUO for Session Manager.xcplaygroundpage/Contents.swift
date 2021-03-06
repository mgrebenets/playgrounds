//: [Previous](@previous)

import Foundation

class SessionManager {
    static var current: SessionManager!

    static func configure() {
        current = SessionManager()
    }
    func doStuff() {
        print("doStuff")
    }
}

//SessionManager.configure()
SessionManager.current?.doStuff()   // nil
SessionManager.current.doStuff()    // Crash

//: [Next](@next)
