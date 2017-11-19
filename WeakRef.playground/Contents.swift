//: Playground - noun: a place where people can play

import Foundation

public struct WeakReference<T: AnyObject> {
    weak var value: T?

    public init(_ value: T) {
        self.value = value
    }

    public func unwrapped() throws -> T {
        guard let value = value else { throw WeakReferenceError.unwrapError }
        return value
    }

}

public extension WeakReference where T: Hashable {

    // MARK: Hashable

    public var hashValue: Int {
        guard let hash = value?.hashValue else { return 0 }
        return hash
    }

    // MARK: Equatable

    public static func == (lhs: WeakReference, rhs: WeakReference) -> Bool {
        guard let lhsVal = lhs.value, let rhsVal = rhs.value else { return true }
        return lhsVal == rhsVal
    }
    
}