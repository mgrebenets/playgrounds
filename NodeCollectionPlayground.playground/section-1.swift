// Playground - noun: a place where people can play

//import SpriteKit

class RawBoxedArray<T where T: AnyObject>: Equatable {
    var array: [T] = []
}

class BoxedArray<T where T: AnyObject, T: Equatable, T: Ownable>: BoxedArray<T> {

}

typealias CardCollection = BoxedCardArray<Card>
class BoxedCardArray<C: Card where C: Equatable>: BoxedArray<C> {
}

class Card: NSObject, NSCoding, Equatable {
    func encodeWithCoder(aCoder: NSCoder) {
    }

    required init(coder aDecoder: NSCoder)  {
    }
}




