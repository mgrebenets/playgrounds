//: [Previous](@previous)

import UIKit

//NSCoding

public typealias Coder = NSCoder

public protocol Codable {
    func encode(coder: Coder)
    init(decoder: Coder) throws
}

// Failed
extension Coder {
    private func indexKey(key: String, index: Int) -> String {
        return key + ".array.\(index)"
    }

    func encode<T: Codable>(codableArray array: [T], forKey key: String) {
        for (index, object) in array.enumerate() {
            encodeObject(object as? AnyObject, forKey: indexKey(key, index: index))
        }
    }

    func decode<T: Codable>(codableArrayForKey key: String) -> [T] {
        print("key: \(key)")
        var index = 0
        var result: [T] = []
        print("indexKey: \(indexKey(key, index: index))")
        let x = decodeObjectForKey(indexKey(key, index: index))
        print(x)
        while let object = decodeObjectForKey(indexKey(key, index: index)) as? T {
            result.append(object)
            index += 1
        }
        return result
    }
}

public enum CodableError: ErrorType {
    case decodingError
}

struct Goal {
    let name: String
    let amount: Double
    let picture: UIImage?
    let steps: [Goal]

    init(name: String, amount: Double, picture: UIImage? = nil, steps: [Goal] = []) {
        self.name = name
        self.amount = amount
        self.picture = picture
        self.steps = steps
    }
}

extension Goal: Codable {

    private enum Keys {
        static let name = "name"
        static let amount = "amount"
        static let picture = "picture"
        static let steps = "steps"
    }

    func encode(coder: Coder) {
        coder.encodeObject(name, forKey: Keys.name)
        coder.encodeDouble(amount, forKey: Keys.amount)
        coder.encodeObject(picture, forKey: Keys.picture)
        coder.encode(codableArray: steps, forKey: Keys.steps)
    }

    init(decoder: Coder) throws {
        guard let name = decoder.decodeObjectForKey(Keys.name) as? String else {
            throw CodableError.decodingError
        }

        let amount = decoder.decodeDoubleForKey(Keys.amount)
        let picture = decoder.decodeObjectForKey(Keys.picture) as? UIImage
        let steps: [Goal] = decoder.decode(codableArrayForKey: Keys.steps)

        self.init(name: name, amount: amount, picture: picture, steps: steps)
    }
}

let steps = [Goal(name: "a", amount: 50), Goal(name: "b", amount: 50.50)]
let goal = Goal(name: "xbox", amount: 100.50, picture: UIImage(), steps: steps)
print(goal)

var data = NSMutableData(capacity: 1000)!
let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
goal.encode(archiver)
archiver.encodeObject("abcd", forKey: "abcd")
archiver.finishEncoding()

print(data)
print(data.length)

let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
let loadedGoal = try Goal(decoder: unarchiver)
print(loadedGoal)

let i = 1
i.advancedBy(1)
print(i)


//: [Next](@next)
