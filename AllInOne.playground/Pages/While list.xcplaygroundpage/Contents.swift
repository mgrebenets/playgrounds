//: [Previous](@previous)

import UIKit

enum List {
    case end
    indirect case node(value: Int, next: List)
}

let list: List = .node(
    value: 0,
    next: .node(
        value: 1,
        next: .node(
            value: 2,
            next: .end)
    )
)

extension UIView {

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

let pvc = UIViewController()
let vc = UIViewController()
pvc.addChildViewController(vc)

print(pvc.view)
print(vc.view)

let f = vc.view.parentViewController
f

let images: [UIImage] = []
enum Result {
    case failure, success([UIImage])
}

let result: Result = .success([])

switch result {
case .failure: break
case .success(let images):
    if let firstImage = images.first {
        print("success")
    } else {
        print("empty")
    }
}

let s: String? = "a"
let w = s.flatMap { [$0] }
print(w)
let ns: String? = nil
let w2 = ns.flatMap { [$0] }
print(w2)

//: [Next](@next)
