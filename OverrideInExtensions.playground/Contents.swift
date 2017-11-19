//: Playground - noun: a place where people can play

import UIKit

class A: UIViewController {
    func didTapButton(in controller: UIView) {

    }
}

class B: A {

}

extension B {
    override func didTapButton(in controller: UIView) {
        print("override")
    }
}

var family = "👩"
family += "\u{200D}👩"
family += "\u{200D}👧"
family += "\u{200D}👦"