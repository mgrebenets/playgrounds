//: [Previous](@previous)

import Foundation

struct Model {
    private enum Constants {
        static let value = 100
        enum K {
            static let value = NSDate()
            static let v = "asdfa"
            func afunc() {

            }
        }
    }

    func doSomething() {
        print(Constants.value)
        //        let e = Constants;;;;;
        //        let c = Constants()
        //        c.dynamicType.value
        //        c.value
    }
}

Model().doSomething()


print("x")


enum Keys {
    static let name = "name"
}

let key = "someKey"

switch key {
case Keys.name: print("name")   // error: enum case 'name' not found in type 'String'
default: print("not a name")
}

//: [Next](@next)
