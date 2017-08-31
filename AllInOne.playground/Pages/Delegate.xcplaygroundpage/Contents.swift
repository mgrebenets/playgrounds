//: [Previous](@previous)

import UIKit

struct BalanceSheet {}

class SoleTrader {
    let balanceSheet: BalanceSheet = BalanceSheet()
    weak var delegate: TaxAccountant?

    func eoyReport() {
        delegate?.doTaxes(
            for: self,
            with: balanceSheet)
    }
}

protocol TaxAccountant: class {
    func doTaxes(with balanceSheet: BalanceSheet)

    func doTaxes(
        for soleTrader: SoleTrader,
        with balanceSheet: BalanceSheet)
}

class Accountant: TaxAccountant {
    func doTaxes(with balanceSheet: BalanceSheet) {
        // TODO: Taxes
    }

    func doTaxes(
        for soleTrader: SoleTrader,
        with balanceSheet: BalanceSheet) {

    }
}

let alice = SoleTrader()
let donald = SoleTrader()

let bob = Accountant()

alice.delegate = bob
donald.delegate = bob

alice.eoyReport()
donald.eoyReport()

//: [Next](@next)
