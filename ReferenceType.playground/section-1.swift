// Playground - noun: a place where people can play

import UIKit

class Session {

}

extension Session: ServiceErrorInterceptor {
    func doStuff() {
        print("doStuff")
    }
}

struct SessionConfiguration {
    var serviceErrorInterceptor: ServiceErrorInterceptor?
}

protocol ServiceErrorInterceptor: class {
    func doStuff()
}

class ServiceErrorInterceptorProxy: ServiceErrorInterceptor {
    weak var interceptor: ServiceErrorInterceptor?

    func doStuff() {
        interceptor?.doStuff()
    }
}

let configuration = SessionConfiguration()

var updatedConfiguration = configuration
let proxy = ServiceErrorInterceptorProxy()
updatedConfiguration.serviceErrorInterceptor = proxy
let copy1 = updatedConfiguration
let copy2 = updatedConfiguration
let copy3 = updatedConfiguration

dump(copy1)
dump(copy2)
dump(copy3)

let session = Session()
proxy.interceptor = session

dump(copy1)
dump(copy2)
dump(copy3)


let messages = ["a", "b", "c"]

let index = 0

if index == messages.startIndex {
    print("start")
}

let prevIndex = index.advanced(by: -1)

messages.indices.contains(prevIndex)


let 😀 = "this is sstupid"
print(😀)
