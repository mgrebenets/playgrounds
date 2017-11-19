//: Playground - noun: a place where people can play

import Foundation

extension NSString {
    func firstCharacterIsLetter() -> Bool {
        let firstChar = characterAtIndex(0)
        return (firstChar >= 65 && firstChar <= 90) || (firstChar >= 97 && firstChar <= 122)
    }

    func startsWithLetterCharacter() -> Bool {
        return NSCharacterSet.letterCharacterSet().characterIsMember(characterAtIndex(0))
    }
}


let strings: [NSString] = ["abc", "123", "&xyz", "эюя"]
for s in strings {
    print(s.firstCharacterIsLetter())
    print(s.startsWithLetterCharacter())
}


