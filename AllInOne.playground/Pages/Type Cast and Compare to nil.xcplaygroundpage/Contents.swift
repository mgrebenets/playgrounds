//: [Previous](@previous)

import Foundation

class Service {}
class DPService: Service {}
class HelixService: Service {}

let sender: Any = DPService()
let isDPService = (sender as? DPService != nil)
print(isDPService)

//: [Next](@next)
