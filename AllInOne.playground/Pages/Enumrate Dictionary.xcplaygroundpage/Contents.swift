//: [Previous](@previous)

import Foundation

class ActivityIndicator {}


let activityIndicator = ActivityIndicator()
var currentActivityIndicators: [Int: ActivityIndicator] = [
    1: activityIndicator,
    2: ActivityIndicator()
]

var hashToRemove: Int?
for (hash, currentActivityIndicator) in currentActivityIndicators where activityIndicator === currentActivityIndicator {
    hashToRemove = hash
}
dump(hashToRemove)

hashToRemove = currentActivityIndicators.first { $0.value === activityIndicator }?.key
dump(hashToRemove)

//: [Next](@next)
