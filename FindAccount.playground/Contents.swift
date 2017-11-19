//: Playground - noun: a place where people can play

import UIKit

struct CBAAccount {
    var unformattedAccountNumber = "1234"
}

class InstantReceiptService {
    static var optedInAccounts: [String] {
        return []
    }
}

/// SequenceType CBAUtil extension.
public extension SequenceType {

    /// Returns the first element of the sequence that satisfies the given predicate or nil if no such element is found.
    ///
    /// This function is only available for Swift 2.2 and 2.3.
    /// In Swift 3.0 this function is part of standard library and is available for `Collection` and `Sequence` types.
    /// See [Swift documentation](http://swiftdoc.org/v3.0/type/Set/#func-first-where_)
    func first(@noescape where predicate: (Generator.Element) throws -> Bool) rethrows -> Generator.Element? {
        for element in self {
            if try predicate(element) {
                return element
            }
        }
        return nil
    }
}


func firstInstantReceiptAccount(accounts: [CBAAccount]) -> CBAAccount? {

    // checks if any of the accounts in the source array are also in the InstantReceiptService.optedInAccounts
    // if found, returns the acct, otherwise nil

    return accounts.first { checkIREligible($0) }
}

func checkIREligible(account: CBAAccount) -> Bool {
    return InstantReceiptService.optedInAccounts.contains(account.unformattedAccountNumber)
}