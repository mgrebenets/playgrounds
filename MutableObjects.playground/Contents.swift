//: Playground - noun: a place where people can play

import UIKit

class Setting {
    var on: Bool = false
}

var settings = [Setting(), Setting(), Setting()]
var s2 = settings

struct X {
    var s: Setting
}


func doSomething(setting: Setting) {

}

let x = X(s: settings[1])

doSomething(setting: settings[1])

settings[1].on = true
x.s.on


settings[1].on = true
settings
