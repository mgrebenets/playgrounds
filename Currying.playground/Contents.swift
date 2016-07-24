//: Playground - noun: a place where people can play

import UIKit

public struct Model {
    let name: String
    let age: Int
    let iq: Int


    public init(name: String, age: Int, iq: Int) {
        self.name = name
        self.age = age
        self.iq = iq
    }


    public init(model: Model, name: String? = nil, age: Int? = nil, iq: Int? = nil) {
        let name = name ?? model.name
        let age = age ?? model.age
        let iq = iq ?? model.iq
        self.init(name: name, age: age, iq: iq)
    }

//    public func update(model: Model, name: String? = nil, age: Int? = nil, iq: Int? = nil) -> Model {
//        return Model(model: model, name: name, age: age, iq: iq)
//    }

}

let m = Model(name: "a", age: 5, iq: 7)
print(m)
let m2 = Model(model: m)
print(m2)
let m3 = Model(model: m, iq: 100, name: "x")
print(m3)


print("xxx")
