//: [Previous](@previous)

import Foundation

let a1 = ["bag", "bat", "tab"]
let a2 = ["gab", "bat", "lat"]

func hasAnagrams(array: [String]) -> Bool {
    return Set(array.map { String($0.characters.sorted()) }).count != array.count
}

hasAnagrams(array: a1)
hasAnagrams(array: a2)

//func hasAnagramsEffecient(array: [String]) -> Bool {
//    let set = NSMutableSet()
//    for string in array {
//        NSArray(objects: (string as NSString).byte!, count: string.characters.count)
//        let stringSet = NSCountedSet(array: (string as NSString).utf8String)
//        if set.contains(stringSet) {
//            return true
//        }
//        set.add(stringSet)
//    }
//
//    return false
//}
//
//hasAnagramsEffecient(array: a1)
//hasAnagramsEffecient(array: a2)

//: [Next](@next)
