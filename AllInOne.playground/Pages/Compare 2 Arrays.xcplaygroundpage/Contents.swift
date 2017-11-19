//: [Previous](@previous)

import Foundation

struct CustomObject {
    let points: UInt

    init(points: UInt) {
        self.points = points
    }
}

extension CustomObject: Equatable {
    public static func == (lhs: CustomObject, rhs: CustomObject) -> Bool {
        return lhs.points == rhs.points
    }
}

//typealias CustomObject = Int

let a1: [CustomObject] = [1, 2, 3, 4].map { CustomObject(points: $0) }
let a2: [CustomObject] = [1, 2, 3, 3].map { CustomObject(points: $0) }

//let s1 = Set(a1)
//let s2 = Set(a2)
//
//let diff = s1.symmetricDifference(a2)

let diff = a1.filter { !a2.contains($0) }
print(diff)


//: [Next](@next)
