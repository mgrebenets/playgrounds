//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

enum Constants {
    static let animcationImagesCount = 5
}

let array = (1...Constants.animcationImagesCount).flatMap {
    UIImage(named: "siri_onboarding_\($0)")
}

let array2 = (1..<Constants.animcationImagesCount).flatMap {
    UIImage(named: "siri_onboarding_\($0)")
}
