//: [Previous](@previous)

import UIKit

let closure = { (type: UIView.Type) -> UIView in
    return type.init()
}

let v = closure(UIView.self)
let w = closure(UITextView.self)
dump(w)

let closureType = type(of: { (type: UIView.Type) -> UIView in
    return type.init()
    })

dump(closureType)

//<T: UIView> let closureType2 = type(of: { (type: T.Type) -> T in
//    return type.init()
//})
//
//dump(closureType2)

let f = false
let type = f ? UIView.self : UITextView.self
dump(type)
//let type2 = f ? UIView.Type : UITextView.Type

//: [Next](@next)
