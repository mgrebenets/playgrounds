//: Playground - noun: a place where people can play

import Foundation

let now = DispatchTime.now()

let delayTime =  now + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
dump(delayTime)

let delayTime2 = now + Double(0.1 * Double(NSEC_PER_SEC)) / Double(NSEC_PER_SEC)
dump(delayTime2)

let delayTime3 = now + .microseconds(1)
dump(delayTime3)

let delayTime4 = now + 0.1
dump(delayTime4)

