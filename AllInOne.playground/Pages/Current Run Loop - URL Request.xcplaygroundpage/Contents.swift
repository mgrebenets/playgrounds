//: [Previous](@previous)

import UIKit

var str = "Hello, playground"


let url = NSURL(string: "")!
let data: NSData = NSData()
let json = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)


let queue = OperationQueue.current
let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: queue)
let task = session.dataTask(with: url as URL) { data, response, error in
    print(data!)
}
task.resume()

//let connection = NSURLConnection()
//connection.sync

let runLoop = RunLoop.current
var shouldFinishRunning = true
while shouldFinishRunning == false &&
    runLoop.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: 0.1) as Date) {
        // Nothing
}


print(";;;")

//: [Next](@next)
