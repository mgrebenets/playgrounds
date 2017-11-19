//: Playground - noun: a place where people can play

import UIKit




class StaticGenericNetworkService {

    // "Enjoy" your unit testing!
    static var httpClient = { Void -> AFHTTPClient in
        let client: AFHTTPClient = AFHTTPClient(baseURL: NSURL(string:"http://localhost"))
        return client
    }()

    typealias WebCallCompletionBlock = () -> Void

    static func makeGetRequest(url: NSURL, completion: WebCallCompletionBlock) {
        let request = NSMutableURLRequest(URL: url)
        makeRequest(request, completion: completion)
    }

    static func makeRequest(urlRequest: NSURLRequest, completion: WebCallCompletionBlock?) {
        
    }
}

class AFHTTPClient {
    init(baseURL: NSURL?) {

    }
}

class GenericNetworkService {

    private let httpClient: AFHTTPClient

    // Dependency injection, ENJOY your unit testing!
    init(baseURL: NSURL) {
        self.httpClient = AFHTTPClient(baseURL: baseURL)
    }

    typealias WebCallCompletionBlock = () -> Void

    func makeGetRequest(url: NSURL, completion: WebCallCompletionBlock) {
        let request = NSMutableURLRequest(URL: url)
        makeRequest(request, completion: completion)
    }

    func makeRequest(urlRequest: NSURLRequest, completion: WebCallCompletionBlock?) {

    }
}


class NotASingleton {
    static var state: String!

    static func doSomething() {

    }
}

class JustAClass {
    var state: String

    init(state: String) {
        self.state = state
    }

    static func doSomething() {

    }
}

class Customer {
    // Factory
    static func customer(payload: [String: AnyObject]) -> Customer {
        return Customer()
    }
}

extension Customer {
    // Initializer
    convenience init(payload: [String: AnyObject]) {
        self.init()
    }
}