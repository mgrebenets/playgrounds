//: Playground - noun: a place where people can play

import UIKit

class MyViewController: UIViewController {

}

let vc = UIViewController()
let mvc = MyViewController()

if let mvc = mvc as? MyViewController {
    print("mbc")
}

typealias t = AnyObject.Type
typealias c = AnyClass.Type

var x: AnyClass

if let vc = vc as? t {

}

if let vc = vc as? c {

}

//if let vc = vc as? x {
//
//}
//
//if let vc = vc is x {
//
//}

