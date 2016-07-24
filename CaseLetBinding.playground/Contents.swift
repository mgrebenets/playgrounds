//: Playground - noun: a place where people can play

import UIKit

enum Result<T, E: ErrorType> {
    case success(T)
    case failure(E)
}

enum Error: ErrorType {
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