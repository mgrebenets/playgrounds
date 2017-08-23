//: Playground - noun: a place where people can play

import PlaygroundSupport

import UIKit
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

class X {

    var logoutTimer: Timer?

    func start() {
        let interval: TimeInterval = 1
        logoutTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(handleLogoutTimeout), userInfo: nil, repeats: false)
    }

     @objc private func handleLogoutTimeout(timer: Timer) {
        print("hi")
    }
}

let x = X()
x.start()
