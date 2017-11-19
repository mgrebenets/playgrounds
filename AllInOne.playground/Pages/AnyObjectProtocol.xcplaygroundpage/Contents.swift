//: [Previous](@previous)

import UIKit

protocol ManagerDelegate: Hashable {

}

class X<T: ManagerDelegate> {
    var delegates: [Int: T] = [:]

    func addDelegate(delegate: T) {
        delegates[delegate.hashValue] = delegate
    }
}


struct D: ManagerDelegate {
    var hashValue: Int { return 0 }
}

func ==(lhs: D, rhs: D) -> Bool {
    return lhs.hashValue == rhs.hashValue
}


let x = X<D>()
x.addDelegate(delegate: D())
x.addDelegate(delegate: D())

import Foundation

/// Since there can be multiple delegates, they can only be used to signifying events (output), not for
/// supplying data for the manager (input).
@objc protocol MyManagerDelegate {
    func manager(manager: MyManager, isNowLoading: Bool)
}

@objc class MyManager: NSObject {

    /// Multiple delegates.
    let delegates = NSHashTable<AnyObject>.weakObjects()

    // Add a delegate.
    func addDelegate(delegate: MyManagerDelegate) {
        delegates.add(delegate)
    }

    /// Example of how you'd call the multiple delegates.
    func tellDelegatesIsNowLoading(loading: Bool) {
        print("tell")
        delegates.allObjects.map { (delegate: AnyObject) -> Void in
            print("tell more")
            (delegate as! MyManagerDelegate).manager(manager: self, isNowLoading: loading)
            print("tell more 2")

            //            return nil
        }
        //        for object in delegates.allObjects {
        //            let delegate = object as MyManagerDelegate
        //            delegate.manager(self, isNowLoading: loading)
        //        }
    }
}

class ConcreteDelegate: MyManagerDelegate {
    func manager(manager: MyManager, isNowLoading: Bool) {
        print("is now loading: \(isNowLoading)")
    }
}

let mgr = MyManager()
mgr.addDelegate(delegate: ConcreteDelegate())
mgr.tellDelegatesIsNowLoading(loading: false)
mgr.tellDelegatesIsNowLoading(loading: true)


print("why")



//: [Next](@next)
