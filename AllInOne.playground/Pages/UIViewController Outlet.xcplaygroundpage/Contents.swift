//: [Previous](@previous)

import UIKit

let vc = UIViewController()
let v1 = vc.view    // open var view: UIView!
let v2: UIView! = vc.view
let v3: UIView = vc.view
let v4: UIView? = vc.view

dump(v1)
dump(v4)

Mirror(reflecting: vc.view).description
Mirror(reflecting: v1).description
Mirror(reflecting: v2).description
Mirror(reflecting: v3).description
Mirror(reflecting: v4).description

type(of: v1)
type(of: v1!)
type(of: v2)
type(of: v2!)
type(of: v3)
type(of: v4)

vc.view.tag

v1?.tag
v2.tag
v3.tag
v4?.tag

//: [Next](@next)
