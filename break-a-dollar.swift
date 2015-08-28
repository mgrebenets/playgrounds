#!/usr/bin/env xcrun swift

// Break a Dollar

// import Foundation for C standard library methods
import Foundation

// MARK: Types

/// Change type
typealias Change = [Coin]

/// Coins enum
enum Coin: Int, Comparable {
    case Penny = 1, Nickel = 5, Dime = 10, Quarter = 25, HalfDollar = 50, Dollar = 100

    var value: Int { return rawValue }

    var name: String {
        switch self {
        case .Penny: return "Penny"
        case .Nickel: return "Nickel"
        case .Dime: return "Dime"
        case .Quarter: return "Quarter"
        case .HalfDollar: return "Half Dollar"
        case .Dollar: return "Dollar"
        }
    }

    static var allCoins: Change {
        return [.Penny, .Nickel, .Dime, .Quarter, .HalfDollar, .Dollar]
    }
}

/// Comparable protocol
/// :param: left Left operand
/// :param: right Right operand
/// :returns: Bool
func <(left: Coin, right: Coin) -> Bool {
    return left.value < right.value
}

/// Equatable protocol
/// /// :param: left Left operand
/// :param: right Right operand
/// :returns: Bool
func ==(left: Coin, right: Coin) -> Bool {
    return left.value == right.value
}

// MARK: Extensions

/// Array extensions
extension Array {

    /// Return shuffled array
    /// :returns: shuffled array
    func shuffled() -> [T] {
        var list = self
        for i in 0..<(list.count - 1) {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
}

// MARK: Algorithm

/// Count number of ways you can make change with given coins
/// :param: amount Amound of money to change
/// :param: coins Coins used to make change
/// :returns: number of _different_ ways to change money
func makeChange(amount: Int, usingCoins coins: Change) -> Int {
    if coins.isEmpty || amount < 0 {
        return 0
    } else if amount == 0 {
        return 1
    } else {
        return makeChange(amount - coins.first!.value, usingCoins: coins) + makeChange(amount, usingCoins: Change(dropFirst(coins)))
    }
}

// MARK: -
// MARK: Test
typealias TestData = (amount: Int, coins: Change)
let testData: [TestData] = [
    TestData(Coin.Dollar.value, Coin.allCoins),
    TestData(Coin.Dollar.value, Coin.allCoins.sorted(>)),
    TestData(Coin.Dollar.value, Coin.allCoins.shuffled()),
    TestData(Coin.Dollar.value, [Coin.HalfDollar]),
    TestData(Coin.Dollar.value, [Coin.Quarter, Coin.HalfDollar]),
    TestData(42, Coin.allCoins),
    TestData(42, [Coin.Dime])
]

for test in testData {
    let count = makeChange(test.amount, usingCoins: test.coins)
    println("Found \(count) ways to change \(test.amount) cents using \(test.coins.map { $0.name })")
}
