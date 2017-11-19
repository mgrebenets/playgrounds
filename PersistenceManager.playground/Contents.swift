//: Playground - noun: a place where people can play

import UIKit

let pathsArray = [
    ["a", "b/c/d", "x"],
    ["a", "b/a/d"],
    ["b/a/", "b/a/d"],
    ["c/d", "a/b", "a"],
    ["d", "c/d"],
    ["a", "a"],
    []
]

func hasClashingPaths(_ paths: [String]) -> Bool {
    let sortedPaths = paths.sorted()
    print(sortedPaths)
    let pairs = zip(sortedPaths, sortedPaths.dropFirst())
    return pairs.reduce(false) { result, pair in
//        print("\(pair.1) - \(pair.0)")
        return result || pair.1.hasPrefix(pair.0)
    }
}

for paths in pathsArray {
    let clashes = hasClashingPaths(paths)
    print(clashes)
}

