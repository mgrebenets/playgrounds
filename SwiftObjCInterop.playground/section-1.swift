// Playground - noun: a place where people can play

import SpriteKit
typealias BaseObjCClass = SKNode

enum PureSwiftEnum {
    case Value, AnotherValue
}

protocol PureSwiftProtocol {
    var value: PureSwiftEnum { get }
    var itemSize: CGSize { get set }
}

class ObjCSubclass: BaseObjCClass, PureSwiftProtocol {
    var value: PureSwiftEnum = .Value
    var itemSize: CGSize = CGSizeZero
}

class GenericClass<T where T: PureSwiftProtocol> {
    var node: T
    init(node: T) {
        self.node = node
    }

    func accessValue() -> PureSwiftEnum {
        return node.value
    }

    func accessItemSize() -> CGSize {
        return node.itemSize
    }
}


let objectGeneric = GenericClass(node: ObjCSubclass())
// let wrapperGeneric = GenericClass(node: wrapper)

println(objectGeneric.accessValue())
// println(wrapperGeneric.accessValue())
println(objectGeneric.accessItemSize())
