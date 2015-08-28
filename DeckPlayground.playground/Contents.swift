//: Playground - noun: a place where people can play

import SpriteKit

struct Card {
    let rank: Int
    init(rank: Int = 0) {
        self.rank = rank
    }
}

// struct Deck {
class Deck {
    var cards = [Card(), Card(), Card()]
}

struct Game {
    var deck = Deck()
}


class DeckNode: SKNode {
    var deck: Deck
    init(deck: Deck) {
        self.deck = deck
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


let game = Game()
var deckNode = DeckNode(deck: game.deck)

game.deck.cards.append(Card())
print(game.deck.cards)
print(deckNode.deck.cards)

protocol EquatableClass: class, Equatable {
    func equals(other: Self) -> Bool
}

class A: EquatableClass {
    let a: Int
    init(a: Int) {
        self.a = a
    }

    func equals(other: A) -> Bool {
        return a == other.a
    }
}

func ==<T where T: A>(lhs: T, rhs: T) -> Bool {
    return lhs.equals(rhs)
}

class B: A {
    let b: Int
    init(a: Int, b: Int) {
        self.b = b
        super.init(a: a)
    }

    override func equals(other: A) -> Bool {
        return super.equals(other)
            && b == (other as! B).b // It is safe to do this type cast here
    }
}

class AA: Equatable {
    let a: Int
    init(a: Int) {
        self.a = a
    }

    func equals<T where T: AA>(other: T) -> Bool {
        return a == other.a
    }
}

func ==<T where T: AA>(lhs: T, rhs: T) -> Bool {
    return lhs.equals(rhs)
}

class BB: AA {
    let b: Int
    init(a: Int, b: Int) {
        self.b = b
        super.init(a: a)
    }

    override func equals<T where T : BB>(other: T) -> Bool {
        return super.equals(other) && b == other.b
    }
}

let a1 = A(a: 1)
let a2 = A(a: 1)
let a3 = A(a: 3)
print(a1 == a2)
print(a1 == a3)

let b1 = B(a: 1, b: 1)
let b2 = B(a: 1, b: 1)
let b3 = B(a: 1, b: 2)
print(b1 == b2)
print(b1 == b3)

class CardClass {
    var faceDown = false
    let rank: Int
    init(rank: Int = 0) {
        self.rank = rank
    }
}

extension CardClass: Equatable {

}

func ==<T where T: CardClass>(lhs: T, rhs: T) -> Bool {
    return lhs.rank == rhs.rank
}

let cc1 = CardClass(rank: 1)
let cc2 = CardClass(rank: 2)
let ccArr1 = [cc1, cc2]
let ccArr2 = [cc1, cc2]
print(cc1 == cc2)
print(ccArr1 == ccArr2)

class CardClassX: CardClass {
    let x: Int
    init(rank: Int, x: Int) {
        self.x = x
        super.init(rank: rank)
    }
}

let ccx1 = CardClassX(rank: 1, x: 1)
let ccx2 = CardClassX(rank: 1, x: 1)
let ccx3 = CardClassX(rank: 1, x: 2)
let ccxArr1 = [ccx1, ccx2, ccx3]
let ccxArr2 = [ccx1, ccx2, ccx3]
let ccxArr3 = [ccx1, ccx2, ccx2]
print(ccx1 == ccx2)
print(ccx1 == ccx3)
print(ccxArr1 == ccxArr2)
print(ccxArr1 == ccxArr3)


class DeckClass {
    var cards = [Card(), Card(), Card()]
}

class GameClass {
    var deck = DeckClass()
}

class DeckClassNode: SKNode {
    var deck: DeckClass
    init(deck: DeckClass) {
        self.deck = deck
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


var gameClass = GameClass()
var deckClassNode = DeckClassNode(deck: gameClass.deck)
gameClass.deck.cards.append(Card())
print(gameClass.deck.cards)
print(deckClassNode.deck.cards)

class CardClassNode: SKNode {
    let card: CardClass
    init(card: CardClass) {
        self.card = card
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

var cardClass = CardClass()
var cardClassNode = CardClassNode(card: cardClass)
print(cardClass.faceDown)
cardClassNode.card.faceDown = true
print(cardClass.faceDown)


struct Person {
    var age: Int

    init(age: Int) {
        self.age = age
    }

    // Mutating
    mutating func mutatingBirthday() {
        age = age + 1
    }

    // Immutable
    func birthday() -> Person {
        return Person(age: age + 1)
    }
}

// Must be NSObject
//class NSCodingClass: NSCoding {
//
//}

protocol NSCodingSubprotocol: NSCoding {

}

// Yeah, can't cheat the compiler
//class NSCodingSubprotocolClass: NSCodingSubprotocol {
//
//}

protocol Coding {
    func encodeWithCoder(aCoder: NSCoder)
    init?(coder aDecoder: NSCoder) // NS_DESIGNATED_INITIALIZER
}

class CodingClass: Coding {
    init() {

    }

    func encodeWithCoder(aCoder: NSCoder) {

    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

let codingClass = CodingClass()
print(codingClass)
