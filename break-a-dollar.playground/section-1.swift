// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum Coin: Int {
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

    static var allCoins: [Coin] {
        return [.Penny, .Nickel, .Dime, .Quarter, .HalfDollar, .Dollar]
    }
}

func <(left: Coin, right: Coin) -> Bool {
    return left.value < right.value
}

func makeChange(amount: Int, usingCoins coins: [Coin]) -> Int {
    return countWaysToBreakAmount(amount, usingCoins: coins.sorted(<))
}

func countWaysToBreakAmount(amount: Int, usingCoins coins: [Coin]) -> Int {

    if coins.isEmpty || amount < 0 {
        return 0
    } else if amount == 0 {
        return 1
    } else {
        return countWaysToBreakAmount(amount - coins.first!.value, usingCoins: coins) + countWaysToBreakAmount(amount, usingCoins: Array<Coin>(dropFirst(coins)))
    }
}

let count = makeChange(Coin.Dollar.value, usingCoins: Coin.allCoins)
println(count)

