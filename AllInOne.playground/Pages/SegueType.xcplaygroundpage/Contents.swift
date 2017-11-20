//: [Previous](@previous)

import UIKit

protocol SegueType: RawRepresentable {
//    init(segue: UIStoryboardSegue)
}

extension SegueType where RawValue == String {
    init?(segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else { return nil }
        self.init(rawValue: identifier)
    }
}

enum StoryboardSegue {
    enum AccountOnboarding: String, SegueType {
        case closeAndUnwindToTransactionsViewController
        case doneAndUnwindToTransactionsViewController
        case getFundsOptions
        case unwindToTransactionsViewController
    }
}

let s = UIViewController()
let d = UIViewController()
let segue = UIStoryboardSegue(identifier: "closeAndUnwindToTransactionsViewController", source: s, destination: d)

let e = StoryboardSegue.AccountOnboarding.init(segue: segue)
dump(e)

//: [Next](@next)
