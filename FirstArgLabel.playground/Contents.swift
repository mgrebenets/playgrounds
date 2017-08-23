//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Authenticator {
    func login(_ pin: String) -> Void
    func logout(completion: () -> Void)
    
    func login(pin: String) -> Void
    func logout(completion: () -> Void)
}


let manager = Authenticator()

manager.login("1234")

manager.logout(completion: {})

manager.logout({})

func f(closure: () -> Void)
func f(closure: @noescape () -> Void)
func f(closure: @escaping () -> Void)


class Example {
    
    var closure: () -> Void = {}
    
    func f(closure1: @escaping () -> Void,
           closure2: @escaping () -> Void,
           closure3: () -> Void,
           closure4: @escaping () -> Void,
           closure5: () -> Void) -> Void {
        
        self.closure = closure1
        DispatchQueue.main.async {
            closure2()
        }
        
        g(closure: closure3)
        p(closure: closure4)
        closure4()
    }
    
    func g(closure: () -> Void) {}
    func p(closure: @escaping () -> Void) {}
    
    func updateUI() {}
    func x() {
        DispatchQueue.main.sync {
            self.updateUI()
        }
        
        DispatchQueue.main.sync {
            updateUI()  // self is implicit for non-escaping closures
        }

    }
    
    
    
    @discardableResult func l() -> Int { return 0 }
    
    func noReturn() -> Never {}
    
    enum X: LocalizedError {
        
    }
}


