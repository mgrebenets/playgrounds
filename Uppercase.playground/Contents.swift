//: Playground - noun: a place where people can play

import UIKit


extension String {
    /// Dictionary key with first character lowercase
    internal var lowercaseDictionaryKey: String {
        return dictionaryKey(.Lowercase)
    }

    /// Dictionary key with first character uppercase
    internal var uppercaseDictionaryKey: String {
        return dictionaryKey(.Uppercase)
    }

    /// Helper enum for text case
    private enum TextCase {
        case Uppercase, Lowercase
    }

    private func dictionaryKey(textCase: TextCase) -> String {
        var result = String(self)
        let firstChar: String = {
            let tmpChar = String(self[startIndex])
            return textCase == .Uppercase ? tmpChar.uppercaseString : tmpChar.lowercaseString
        }()

        result.replaceRange(startIndex...startIndex, with: firstChar)
        return result
    }
}

"CollectionCode".lowercaseDictionaryKey // "collectionCode"
"collectionCode".uppercaseDictionaryKey // "CollectionCode"

let s = "a", q = "3"
let i = Int(s), j = Int(q)
print(i)
print(j)

s as? Int
q as? Int

let dic: [String: AnyObject] = ["a": "b"]


let array: [Int]? = nil
array?.count

let rowCount: Int = array?.count ?? 0

struct Account {}

class Customer {
    var accounts: [Account]?
}

class Customer 