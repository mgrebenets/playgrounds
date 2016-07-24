//: Playground - noun: a place where people can play

import UIKit

enum Frequency {
    case weekly, fortnightly, monthly, occasionally
    var optionsTitle: String { return "xxx" }
}

class VC: UIViewController {

    func didSelectFrequency(frequency: String) {

    }

    func f() {

        let alert = UIAlertController(title: "title", message: nil, preferredStyle: .ActionSheet)

        let actions = [
            UIAlertAction(title: "title", style: .Default) { _ in
                self.didSelectFrequency("f")
            },
            UIAlertAction(title: "title", style: .Default) { _ in
                self.didSelectFrequency("f")
            },
            UIAlertAction(title: "title", style: .Default) { _ in
                self.didSelectFrequency("f")
            },
            UIAlertAction(title: "title", style: .Default) { _ in
                self.didSelectFrequency("f")
            },
            UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
        ]

        actions.forEach { alert.addAction($0) }
    }
}

class FrequecySelectAction: UIAlertAction {
    let frequency: Frequency

    override init() {
        super.init()
        self.frequency = .occasionally
    }

    init(frequency: Frequency, title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) {
        super.init(title: title, style: style, handler: handler)
        self.frequency = frequency
    }
}
extension UIAlertAction {
    var
}