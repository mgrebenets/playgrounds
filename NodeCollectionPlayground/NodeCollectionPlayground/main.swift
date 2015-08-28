//
//  main.swift
//  NodeCollectionPlayground
//
//  Created by Maksym Grebenets on 15/01/2015.
//  Copyright (c) 2015 i4nApps. All rights reserved.
//

import SpriteKit

class RawBoxedArray<T where T: AnyObject> {
    var array: [T] = []
    var count: Int { return array.count }
}

class BoxedArray<T where T: AnyObject, T: Equatable>: RawBoxedArray<T> {

}

func ==<T>(left: BoxedArray<T>, right: BoxedArray<T>) -> Bool {
    if left.count != right.count {
        return false
    }
    for (index, element) in enumerate(left.array) {
        if element != right.array[index] {
            return false
        }
    }
    return true
}

typealias CardCollection = BoxedCardArray<Card>
class BoxedCardArray<C: Card where C: Equatable>: BoxedArray<C> {

}

class Card: NSObject, NSCoding, Equatable {
    override init() {

    }
    func encodeWithCoder(aCoder: NSCoder) {
    }

    required init(coder aDecoder: NSCoder)  {
    }
}

func ==(left: Card, right: Card) -> Bool {
    return false
}

class ContentNode: SKNode {
//    var contentSize: CGSize
}

class CardNode: ContentNode {
    var card: Card
    init(card: Card) {
        self.card = card
        super.init()
    }
}



class CollectionNode: ContentNode {
    typealias CollectionItemType = AnyObject
//    typealias CollectionType = RawBoxedArray<CollectionItemType>
    typealias CollectionType = AnyObject

    var collection: CollectionType

    var nodes: [ContentNode] { return [ContentNode]() }

    init(collection: CollectionType) {
        self.collection = collection
        super.init()
    }

    func nodeForItem(item: AnyObject) -> ContentNode? {
        return nil  // override in subclasses
    }

    func layoutCollectionNodes() {
        // So this is the real problem here, don't know how to enumrate AnyObject...
        let enumerable = collection as RawBoxedArray<CollectionItemType>
        for (index, item) in enumerate(enumerable.array) {
            let node = nodeForItem(item)
        }
    }
}

class CardCollectionNode: CollectionNode {

    var cardCollection: CardCollection { return collection as CardCollection }
    var cardNodes: [CardNode] {
        return CardNodePool().nodesForCollection(cardCollection)
    }
    override var nodes: [ContentNode] {
        return cardNodes
    }

    override func nodeForItem(item: AnyObject) -> ContentNode? {
        return cardNodes.filter { $0.card === item }.first
    }
}

class CardNodePool {
    func nodesForCollection(collection: CardCollection) -> [CardNode] {
        return [CardNode]()
    }
}

let card = Card()
let cardNode = CardNode(card: card)
let hand = CardCollection()
hand.array.append(card)
let handNode = CardCollectionNode(collection: hand)

println(handNode.cardCollection.array)

println("Hello")
