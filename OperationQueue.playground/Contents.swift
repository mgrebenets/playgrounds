//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let vc = UIViewController()
let view = UIView()
vc.view = view
view.backgroundColor = .gray
PlaygroundPage.current.liveView = vc

let opq = OperationQueue()
opq.maxConcurrentOperationCount = 1

let paths = ["a", "b", "c"]

//for _ in 0..<1 {
//    opq.addOperation {
//        print("Add operation")
//        pick(fromPaths: paths)
//    }
//}


let q = DispatchQueue(label: "mock", qos: .background)


let delay: DispatchTime = .now() + 2
DispatchQueue.main.asyncAfter(deadline: delay, execute: {print("delay")})

let group = DispatchGroup()
for _ in 1..<3 {
    print("loop")
    q.async {
        print("run block")
        let sema = DispatchSemaphore(value: 0)
        DispatchQueue.main.async {
            pick(fromPaths: paths) { path in
                print("picked a path: \(path)")
                sema.signal()
            }
        }

        print("wait for group")
        sema.wait()
        print("done waiting for group")
    }
    print("loop end")
}


func pick(fromPaths paths: [String], completion: @escaping (String) -> Void) {
    print("pick")

    let alert = UIAlertController(title: "Endpoint", message: "Pick Response", preferredStyle: .alert)
    paths.forEach { path in
        print("add action for: \(path)")
        let action = UIAlertAction(title: path, style: .default) { action in
            print("done: \(path)")
            completion(path)
        }
        alert.addAction(action)
    }

    vc.present(alert, animated: false, completion: nil)
    print("finish presenting a picker")
}


