//: Playground - noun: a place where people can play

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
}

let alice = SoleTrader()
let donald = SoleTrader()

let bob = Accountant()

alice.delegate = bob
donald.delegate = bob

alice.eoyReport()
donald.eoyReport()

class TV: UITableView {}
class TVD: UITableViewDelegate {}
class TVD: UITableViewDataSource {}

class CV: UICollectionView {}
class CVD: UICollectionViewDelegate {}
class CVD: UICollectionViewDataSource {}


func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int

func tableView(
    _ tableView: UITableView,
    shouldHighlightRowAt indexPath: IndexPath) -> Bool

func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath)

func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell

func numberOfRows(
    in section: Int,
    in tableView: UITableView) -> Int

func shouldHighlightRow(
    at indexPath: IndexPath,
    in tableView: UITableView) -> Bool

func didSelectRow(
    at indexPath: IndexPath,
    in tableView: UITableView)

func cellForRow(
    at indexPath: IndexPath,
    in tableView: UITableView) -> UITableViewCell





