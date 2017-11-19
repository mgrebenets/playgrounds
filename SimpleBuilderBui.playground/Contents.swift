//: Playground - noun: a place where people can play

import Foundation

public struct Person {
    public enum PersonError: Error {
        case invalidAge(Int)
    }

    public let name: String
    public let age: Int

    private init(name: String, age: Int) throws {
        guard age > 0 else { throw PersonError.invalidAge(age) }
        self.name = name
        self.age = age
    }

    public var builder: Builder {
        return Builder(name: name, age: age)
    }

    private init(builder: Builder) throws {
        try self.init(name: builder.innerName, age: builder.innerAge)
    }

    public class Builder {
        fileprivate var innerName: String
        fileprivate var innerAge: Int

        public init(name: String = "", age: Int = 0) {
            self.innerName = name
            self.innerAge = age
        }

        public func name(_ name: String) -> Builder {
            self.innerName = name
            return self
        }

        public func age(_ age: Int) -> Builder {
            self.innerAge = age
            return self
        }

        public func build() throws -> Person {
            return try Person(builder: self)
        }
    }
}

let builder = Person.Builder()
let person = try builder.name("Jack").age(10).build()
print(person)

do {
    let wrongPerson = try builder.name("Karl").age(0).build()
} catch let error {
    print(error)
}


