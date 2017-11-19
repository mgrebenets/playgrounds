//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Analytics {
    var webTrackerID: String?

    static let sharedInstance = Analytics()

    private init() {

    }

    func say() -> String {
        return webTrackerID ?? ""
    }
}

Analytics.sharedInstance.say()


let s = Analytics.sharedInstance
let p = Analytics.sharedInstance
s.webTrackerID = "5"
s.say()
p.say()
p.webTrackerID = "7"
s.say()
p.say()


//Analytics.sharedInstance.webTrackerID = "something"
//Analytics.sharedInstance.webTrackerID = nil


