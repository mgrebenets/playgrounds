//: Playground - noun: a place where people can play

import Foundation

final class Card: CustomDebugStringConvertible {
    let rank: Int

    init(rank: Int) {
        self.rank = rank
    }

    var debugDescription: String {
        return "Card: \(rank)"
    }
}

class CardCollection<C: AnyObject> {
    var array: [C] = []
    var seed: CUnsignedInt = 1

    func shuffle(swap useSwap: Bool = false) {
        for var i = array.endIndex - 1; i > array.startIndex; i-- {
            let j = Int(rand_r(&seed)) % (i + 1)
            if useSwap {
                swap(&array[i], &array[j])
                print("swapping")
            } else {
                let t: C = array[i]
                array[i] = array[j]
                array[j] = t
            }
        }
    }
}

class CardNode: CustomDebugStringConvertible {
    var card: Card

    init(card: Card) {
        self.card = card
    }

    var debugDescription: String {
        return "CardNode: \(card.rank)"
    }
}

class CardCollectionNode {
    var collection: CardCollection<Card>
    init(collection: CardCollection<Card>) {
        self.collection = collection
    }
}


let collection1 = CardCollection<Card>()
let card1 = Card(rank: 1), card2 = Card(rank: 2), card3 = Card(rank: 3)
let collectionNode1 = CardCollectionNode(collection: collection1)

print(collectionNode1.collection.array)
collection1.array.append(card1)
collection1.array.append(card2)
collection1.array.append(card3)

print(collectionNode1.collection.array)
collection1.shuffle()
print(collection1.array.description)

print(collectionNode1.collection.array)


print("---swap---")

let collection2 = CardCollection<Card>()
let card2_1 = Card(rank: 1), card2_2 = Card(rank: 2), card2_3 = Card(rank: 3)
let collectionNode2 = CardCollectionNode(collection: collection2)

print(collectionNode2.collection.array)
collection2.array.append(card2_1)
collection2.array.append(card2_2)
collection2.array.append(card2_3)

print(collectionNode2.collection.array)
collection2.shuffle(swap: true)
print(collection2.array.description)
print(collectionNode2.collection.array)