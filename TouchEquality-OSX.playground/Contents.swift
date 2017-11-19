//: Playground - noun: a place where people can play

import Cocoa

var event = NSEvent()
var anotherEvent: NSEvent?

event == anotherEvent
event === anotherEvent

anotherEvent = event

event == anotherEvent
event == anotherEvent!
event === anotherEvent
