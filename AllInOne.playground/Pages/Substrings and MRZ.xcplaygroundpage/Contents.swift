//: [Previous](@previous)

import Foundation


func passportNumberRange(for text: String) -> Range<String.Index> {
    return text.startIndex..<text.index(text.startIndex, offsetBy: 9)
}

//let s = "5311459437"
let s = "5311459437"
let endIndex = s.index(s.startIndex, offsetBy: 9)
print(s.endIndex)
print(endIndex)
let r = passportNumberRange(for: s)
r.upperBound
r.upperBound < s.endIndex

struct MRZ {
    enum Constants {
        static let numeric = "0123456789"
    }
}

"abc".characters

Set("2123").isSubset(of: Set(MRZ.Constants.numeric))
Set("2a123").isSubset(of: Set(MRZ.Constants.numeric))

("A"..."Z").contains("x")
"A"..."Z"

("0"..."9").contains("0")


let bag = [
    "MA<S",
    "M8<S7",
    "MAKSYM",
    "H8KSYM",
    "M8KSVH",
    "<<<"
]

"M8".padding(toLength: 6, withPad: "x", startingAt: 0)
"M8<S7".padding(toLength: 6, withPad: " ", startingAt: 0)


func buildString(from bag: [String], validator: (String) -> Bool = { _ in true} ) -> String {
    let sortedBag = bag.sorted { $0.count > $1.count }
    let maxLength = sortedBag.first?.count ?? 0

    let sets: [NSCountedSet] = (0..<maxLength).map { index in
        return sortedBag.reduce(NSCountedSet()) { result, s in
            guard index < s.count else { return result }
            let i = s.index(s.startIndex, offsetBy: index)
            guard i < s.endIndex else { return result }
            let c = String(s[i])
            guard validator(c) else { return result }
            result.add(c)
            return result
        }
    }

    return sets.flatMap { $0.heaviestElement as? String }.joined()
}

let p = buildString(from: bag, validator: { $0 != "8" })
p

//let sortedBag = bag.sorted { $0.count > $1.count }
//sortedBag
//let length = sortedBag.first?.count ?? 0
//let paddedBag = sortedBag.map { $0.padding(toLength: length, withPad: "_", startingAt: 0) }
//paddedBag
//
//let sets: [NSCountedSet] = (0..<length).map { index in
//    return sortedBag.reduce(NSCountedSet()) { result, s in
//        guard index < s.count else { return result }
//        let i = s.index(s.startIndex, offsetBy: index)
//        guard i < s.endIndex else { return result }
//        // TODO: THis is where invalid chars can be filtered out if any
//        result.add(String(s[i]))
//        return result
//    }
//}
//sets
////dump(sets)
//
//let p: String = sets.flatMap { $0.heaviestElement as? String }.joined()
//p

extension NSCountedSet {
    var sortedByCount: NSCountedSet {
        return NSCountedSet(array: allObjects.sorted(by: { count(for: $0) > count(for: $1)}))
    }

    var heaviestElement: Any? {
        return allObjects.sorted(by: { count(for: $0) > count(for: $1)}).first
    }
}

//let z = zip(paddedBag[0].characters, paddedBag[1].characters)
//dump(z)
//z.forEach { (e1, e2) in
//    print("\(e1) - \(e2)")
//}



//let range = ..<index
//print(s.utf8)
//type(of: s.utf8)
//let a = Array(s)
//a[0..<9]
//String(a[0..<9])
//type(of: a)

extension Character
{
    var unicodeScalarCodePoint: Int
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars

        return Int(scalars[scalars.startIndex].value)
    }

    var unicodeScalarCodePointBase0: Int {
        return unicodeScalarCodePoint - Character("0").unicodeScalarCodePoint
    }
}

extension String {
    var ascii: [UInt8] {
        return self.flatMap { $0.asciiCode }
    }
}

extension Character {

    var asciiCode: UInt8? {
        guard let scalar = String(self).unicodeScalars.first else { return nil }
        return scalar.isASCII ? UInt8(scalar.value) : nil
    }

    var mrzCode: UInt8 {
        guard let asciiCode = self.asciiCode else { return 0 }
        switch asciiCode {
        case 48...57: return asciiCode - 48
        case 65...90: return asciiCode - 55
        default: return 0
        }
    }
}

let os: String? = "P"
"\(os)"
os.flatMap(String.init(describing:))

//String("A"..."Z")

endIndex < s.endIndex
let n = String(s[..<endIndex])
n.count
let d = Int(String(s[endIndex]))!

func checkDigit(for text: String) -> Int {
    let weights = [7, 3, 1]
    let digits = text.flatMap { Int($0.mrzCode) }
    let sum = digits.enumerated().reduce(0) { (result, entry) in
        let weightIndex = entry.offset % 3
        let weight = weights[weightIndex]
        return result + entry.element * weight
    }
    return sum % 10
}

func verify(text: String, checkDigit digit: Int) -> Bool {
    return digit == checkDigit(for: text)
}

verify(text: n, checkDigit: d)

let pn = "38202187M26070"
checkDigit(for: pn)
let pptn = "531145"
checkDigit(for: pptn)

checkDigit(for: "8202187M260302")   // 5


//[s1.startIndex..<s1.endIndex].contains(range)

//: [Next](@next)
