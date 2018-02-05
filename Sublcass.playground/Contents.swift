
//: Playground - noun: a place where people can play

import UIKit

let amount = NSNumber(value: 3.444444)

Double(amount)
Double(truncating: amount)

enum Result<T, E: Error> {
    case success(T)
    case error(E)
}


typealias NoValue = Void

let s = "abc"

let index = s.startIndex
let start = s.startIndex
let end = s.endIndex
s.substring(to: index)
print(type(of: s.substring(to: index)))
s.prefix(upTo: index)
print(type(of: s.prefix(upTo: index)))

s[..<index]
s.substring(from: index)
s.suffix(from: index)
s[index...]
s.substring(with: start..<end)
s[start..<end]

String(s.prefix(upTo: index))

//let closure: () -> Void = { _ in }
//
//let closure: () -> Void = {}
//
//let closure: (Int, Int) -> Void = { _ in }
//
//let closure: (Int, Int) -> Void = { _, _ in }

let r: Result<Void, NSError> = .success(())
let r2: Result<Void, NSError> = .success(NoValue())

//NSAttributedString
//NSAttributedStringKey

//let attr: [String: Any] = [
//    NSParagraphStyle: UIFont(),
//    NSParagraphStyle: style
//]

//NSParagraphStyleAttributeName

let style: NSParagraphStyle = NSParagraphStyle()


//let attr: [NSAttributedStringKey: Any] = [
//    .font: UIFont(),
//    .paragraphStyle: style
//]

//UILayoutPriorityDefaultHigh
//UILayoutPriorityDefaultLow

let p: UILayoutPriority = .defaultHigh
p.rawValue
//let p: UILayoutPriority = .defaultLow

var constraint: NSLayoutConstraint = NSLayoutConstraint()

constraint.priority = UILayoutPriority(rawValue: 750)

class Manager: NSObject {
    @objc func manage() {}
}

extension String {
    public func matchesRegex(_ regex: String, isCaseInsensitive: Bool) -> Bool {
        let options: NSString.CompareOptions
        if isCaseInsensitive {
            options = [.regularExpression, .caseInsensitive]
        } else {
            options = .regularExpression
        }
        return range(of: regex, options: options) != nil
    }

    public func matchesRegex(_ regex: String) -> Bool {
        return matchesRegex(regex, isCaseInsensitive: false)
    }
}

let paths = ["EDS1", "EDS2", "ABC3", "EDS", "PrefixEDS"]
let prefix = "EDS"

let pattern = prefix + ".*"
let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
let filtered = paths.filter { path in
    path.contains
    let range = NSRange(location: 0, length: path.characters.count)
    return regex.numberOfMatches(in: path, options: .withoutAnchoringBounds, range: range) == 1
}
dump(filtered)

let f2 = paths.filter { $0.matchesRegex(pattern) }
dump(f2)

let f3 = paths.filter(String.matchesRegex(pattern))
dump(f3)

//Bundle.main.path(forResource: "Contents", ofType: ".swift")

let nse = NSError(domain: "a", code: 1, userInfo: nil)
enum MyError: Error {
    case one
}
let e = MyError.one

func handle(error: Error?) -> String? {
    guard let error = error else { return nil }
    let nsError = error as NSError
    return "E"
}

handle(error: nse)
handle(error: e)

e is NSError
nse is NSError




