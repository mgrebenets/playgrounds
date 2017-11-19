//: Playground - noun: a place where people can play

import UIKit

class MyViewController: UIViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var dispatchOnce: dispatch_once_t = 0
        dispatch_once(&dispatchOnce) {
            print("Dispatch once")
        }
    }
}

let v1 = MyViewController()
v1.viewWillAppear(false)
v1.viewWillAppear(false)

let v2 = MyViewController()


