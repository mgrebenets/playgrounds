//: [Previous](@previous)

import Foundation

enum Result<T, E: Swift.Error> {
    case success(T)
    case failure(E)
}

enum Error: Swift.Error {
    case error
}

typealias JSON = [String: AnyObject]


let result: Result<JSON, Error> = .success([:])

if case .success(let response) = result {
    print(response)
    print(result)
}

if case let .success(response) = result {
    print(response)
    print(result)
}

//: [Next](@next)
