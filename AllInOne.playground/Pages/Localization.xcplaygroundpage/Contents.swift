//: [Previous](@previous)

import Foundation

NSLocalizedString(
    "OK, get starget",
    comment: "")

NSLocalizedString(
    "get-started-button.title",
    value: "OK, get started",
    comment: "")

class BaseViewController {
    func doSomething() {}
}

//class ExampleViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
//
//}

//class ExampleViewController: UIViewController {}
//
//extension ExampleViewController: UITableViewDataSource {}
//
//extension ExampleViewController: UITableViewDelegate {}

//extension ExampleViewController {
//
//    override func doSomething() {
//
//    }
//}


struct Person {
    private let firstName: String
    fileprivate let lastName: String

    // ...

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Person {
    var fullName: String {
        return [firstName, lastName].joined(separator: " ")
    }
}


//: [Next](@next)
