//: [Previous](@previous)

import Foundation


enum MyIntEnum: Int {
    case Zero = 0, One, Two, Three, Four, Five, Six, Seven, Eight, Nine
}

extension SequenceType where Self.Generator.Element == String {
    func mapToEnum<T: RawRepresentable where T.RawValue == String>() -> [T] {
        return self.map { T(rawValue: $0)! }
    }

    func mapToEnum<T: RawRepresentable where T.RawValue == Int>() -> [T] {
        return self.map { T(rawValue: Int($0)!)! }
    }
}

extension SequenceType where Self.Generator.Element == Int {
    func mapToEnum<T: RawRepresentable where T.RawValue == String>() -> [T] {
        return self.map { T(rawValue: String($0))! }
    }

    func mapToEnum<T: RawRepresentable where T.RawValue == Int>() -> [T] {
        return self.map { T(rawValue: $0)! }
    }
}

var strs = ["0", "1"]
var enums: [MyIntEnum] = strs.mapToEnum()
print("xxx")

//var nums = Array<MyIntEnum>(strings: strs)
var nums2 = strs.map { MyIntEnum(rawValue: Int($0)!) }
var nums3: [MyIntEnum] = strs.flatMap { MyIntEnum(rawValue: Int($0)!) }
print(nums2)
print(nums3)


//: [Next](@next)
