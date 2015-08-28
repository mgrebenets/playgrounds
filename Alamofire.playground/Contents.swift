//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let url = NSURL(string: "")!
let data: NSData = NSData()
let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil)


let queue = NSOperationQueue.currentQueue()
let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: nil, delegateQueue: queue)
let task = session.dataTaskWithURL(url) { data, response, error in
    print(data)
}
task.resume()

//let connection = NSURLConnection()
//connection.sync

let runLoop = NSRunLoop.currentRunLoop()
var shouldFinishRunning = true
while shouldFinishRunning == false &&
    runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1)) {
    // Nothing
}


print(";;;")