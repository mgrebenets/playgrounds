//: [Previous](@previous)

import UIKit

enum Frequency {
    case weekly, fortnightly, monthly, occasionally
    var optionsTitle: String { return "xxx" }
}

class VC: UIViewController {

    func didSelectFrequency(_ frequency: String) {

    }

    func f() {

        let alert = UIAlertController(title: "title", message: nil, preferredStyle: .actionSheet)

        let actions = [
            UIAlertAction(title: "title", style: .default) { _ in
                self.didSelectFrequency("f")
            },
            UIAlertAction(title: "title", style: .default) { _ in
                self.didSelectFrequency("f")
            },
            UIAlertAction(title: "title", style: .default) { _ in
                self.didSelectFrequency("f")
            },
            UIAlertAction(title: "title", style: .default) { _ in
                self.didSelectFrequency("f")
            },
            UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        ]

        actions.forEach { alert.addAction($0) }
    }
}

//: [Next](@next)
